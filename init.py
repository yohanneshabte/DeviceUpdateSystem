#listAllDrives(): list
#selectDrive(name)
#getDriveInfo() : object/list
#getProjects() : object
#formatData()
#connectToDB()
#insertIntoDB() -- check if data already exists


import win32.win32api as win32api
import win32.win32net as win32net
import win32.win32wnet as win32wnet
import win32.win32file as win32file
import shutil
import os.path
from pathlib import Path
import time
from os import scandir, walk
import win32com.client as com
from db import DB
import util

class Project:
    def __init__(self, id, name, projectLocation, date):
        self.projectID = id
        self.name = name
        self.projectLocation = projectLocation
        self.date = date
        self.size = '0'
    def setProjectInfo(self, size, priorityID, statusID, typeID):
            self.size = size  
            self.priorityID = priorityID
            self.statusID = statusID
            self.typeID = typeID   
    def __eq__(self, other):
        if not isinstance(other, Project):
            return NotImplemented
        return self.projectID == other.projectID and self.name == other.name   
    def __str__(self):
        return "ProjectID: "+self.projectID + ", Name: "+self.name + " => Device: " + self.projectLocation + ", Date: " + self.date + ", Size: " + self.size     

    # add DB to drive if it doesn't exist    
    def addToDB(self, db):
        # 1. check if project already exists (Not implemented)
        # 2. add to DB if it doesn't 
        sql = f"INSERT INTO project VALUES ('{self.projectLocation}_{self.projectID}', '{self.date}', '{self.size}', '{self.name}', {self.priorityID}, {self.statusID}, {self.typeID}, '{self.projectLocation}')"
        try:
            print('Adding to DB: ', sql)
            db.execute(sql)
            db.commit()
        except:
            print(self.projectID,': failed to be added to DB')  

    #if folder(directory) satisfies project spec check continue to access dir
    #check file name/ match against rules
    @staticmethod
    def isValid(proj):
        if not isinstance(proj, Project):
            return False
        if proj.projectID.startswith('P') or proj.projectID.startswith('p') or proj.projectID[0].isdigit():
            return True  
        else: 
            return False     

class Drive:
    driveID = ""
    letter = ""
    totalSize = 0
    freeSpace = 0
    driveMake = False
    driveLocation = ""
    driveSpinDate = None
    driveAge = None
    driveTypeID = 0
    def __init__(self, name, letter, totalSize, freeSpace, driveMake):
        self.letter = letter
        self.driveID = name
        self.totalSize = totalSize
        self.freeSpace = freeSpace
        self.driveMake = driveMake
        
    def setDriveInfo(self, driveTypeID, driveLocation, driveSpinDate, driveAge):
        self.driveTypeID = driveTypeID
        self.driveLocation = driveLocation
        self.driveSpinDate = util.convertTime(driveSpinDate)
        self.driveAge = driveAge

    def __str__(self):
        return self.letter + " => " + self.driveID + ", " + str(self.totalSize) + ", " + str(self.freeSpace) + ", " + str(self.driveMake)
    def __eq__(self, other):
        if not isinstance(other, Drive):
            return NotImplemented
        return self.name == other.name and self.totalSize == other.totalSize    
    # add DB to drive if it doesn't exist    
    def addToDB(self, db):
        # 1. get all drives (Not implemented)
        # 2. check if drive already exists (Not implemented)
        # 3. add to DB if it doesn't 
        sql = f"INSERT INTO drive VALUES ('{self.driveID}', '{self.totalSize}', '{self.driveSpinDate}', '{self.driveLocation}', '{self.driveMake}', {self.driveAge}, {self.driveTypeID})"
        print('committing: ', sql)
        db.execute(sql)
        if 'Y' == str(input('Are you sure you want to add the drive to the DB?(Y/N): ')):
            db.commit()
            print('Drive successfully added to DB')  

def getNetworkDrives():
    #get network drives that may not be mapped
    resume = 0
    while 1:
        (_drives, total, resume) = win32net.NetUseEnum(None, 0, resume)
        for drive in _drives:
            if drive['local']:
                print(drive['local'], "=>", drive['remote'])
        if not resume: break

def doesDriveExist(letter):
    result = False
    oldError = win32api.SetErrorMode(1)
    try:
        freeSpace = win32file.GetDiskFreeSpaceEx(letter)
    except: 
        result = False
    else: 
        result = True
    win32api.SetErrorMode(oldError)
    return result

def listAllDrives():
    localDrives = win32api.GetLogicalDriveStrings()
    drives = localDrives.split('\\\x00')
    while '' in drives:
        drives.remove('')
    return drives



def selectDrive(letter, db):
    name = win32api.GetVolumeInformation(letter)
    totalSize, used, free = shutil.disk_usage(letter) 
    isNetwork = win32file.GetDriveType(letter) == win32file.DRIVE_REMOTE
    driveMake = 'Network' if isNetwork else 'Hard Drive' 
    if name[0].strip() == '':
        deviceID = 'Default'
    else:
        deviceID = name[0] 
    deviceID = str(input("What is Device Name: "))
    drive = Drive(deviceID, letter, util.convertSize(totalSize), util.convertSize(free), driveMake)
    print('This is your drive: ', drive) 
    print('------------------------')
    if 'N' == str(input('Do you want to continue adding to the DataBase?(Y/N): ')):
        return drive
    db.execute('SELECT * FROM `drive type`')
    for type in db.cursor:
        print(type[0], " => ", type[1])
    driveTypeID = int(input('Drive Type ID: '))
    driveLocation = str(input('Drive Location: '))
    driveSpinDate = str(input('Drive Spin Date(mm/dd/yy): '))
    driveAge = int(input('Enter Drive Age: '))
    drive.setDriveInfo(driveTypeID, driveLocation, driveSpinDate, driveAge)
    return drive

def getProjects(letter, drive, priorityID, statusID, typeID):
    start = time.time()
    dirs = os.scandir(letter)
    folders = []
    projects = []
    for folder in dirs:
        # validate if correct project format here
        if folder.is_dir() and not(folder.name.startswith('.')):
            mTimeFormatted = time.strptime(time.ctime(os.path.getmtime(folder.path)), "%c")
            mTime = time.strftime('%Y-%m-%d %H:%M:%S', )
            combined = folder.name.split('-', 1)
            if len(combined) < 2:
                combined.append('Default')
            #create object
            project = Project(combined[0], combined[1], drive.driveID, mTime)
            if Project.isValid(project):
                path_dir = Path(folder.path)
                size = util.convertSize(sum(f.stat().st_size for f in path_dir.glob('**/*') if f.is_file()))
                # to be changed if needed
                project.setProjectInfo(size, priorityID, statusID, typeID)
                project.addToDB(db)
                folders.append([folder.name, mTime, size])
            else:
                folders.append([folder.name, mTime])   
                print("Not Valid to Add: ",project)
            projects.append(project)
    end = time.time()
    print("Execution time: ", end - start, " secs")
    return folders
drives = listAllDrives()

print(drives)

            
while True:
    db = DB()
    letter = str(input("Drive to Scan(Type Quit to quit): "))
    letter = letter.upper()
    if letter == "QUIT":
        break
    if doesDriveExist(letter+':'):  
        thisDrive = selectDrive(letter+':\\', db)
        if thisDrive.driveTypeID != 0 and 'Y' == str(input(f'Do you want to add {thisDrive.driveID} to the DataBase?(Y/N): ')).upper():
            thisDrive.addToDB(db)
        if 'Y' == str(input('Do you want to view/add all valid projects to DB?(Y/N): ')).upper():  
            db.execute('SELECT * FROM `project priority`')
            for type in db.cursor:
                print(type[0], " => ", type[1]) 
            priorityID = int(input('Default Priority ID: ')) 

            db.execute('SELECT * FROM `project status`')
            for type in db.cursor:
                print(type[0], " => ", type[1])       
            statusID = int(input('Default Status ID: '))   
            
            db.execute('SELECT * FROM `project type`')
            for type in db.cursor:
                print(type[0], " => ", type[1]) 
            typeID = int(input('Default type ID: '))   

            projects = getProjects(letter+':\\', thisDrive, priorityID, statusID, typeID)     
    else:
        print(letter, " => is not mounted")
    print("=======================================================\n")    
