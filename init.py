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


class Project:
    def __init__(self, name, dev, date, size):
        self.name = name
        self.dev = dev
        self.date = date
        self.size = size
    def __eq__(self, other):
        if not isinstance(other, Project):
            return NotImplemented
        return self.name == other.name   
    def __str__(self):
        return "Name: "+self.name + " => Device: " + self.dev + ", Date: " + self.date + ", Size: " + self.size       

class Drive:
    letter = ""
    name = ""
    totalSize = 0
    freeSpace = 0
    isNetwork = False
    def __init__(self, letter, name, totalSize, freeSpace, isNetwork):
        self.letter = letter
        self.name = name
        self.totalSize = totalSize
        self.freeSpace = freeSpace
        self.isNetwork = isNetwork
    def __str__(self):
        return self.letter + " => " + self.name + ", " + str(self.totalSize) + ", " + str(self.freeSpace) + ", " + str(self.isNetwork)
    def __eq__(self, other):
        if not isinstance(other, Drive):
            return NotImplemented
        return self.name == other.name and self.totalSize == other.totalSize    

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

def checkIsProject(name):
    #if folder(directory) satisfies project spec check continue to access dir
    #check file name/ match against rules
    if name.startswith('.'):
        return False
    return True

def selectDrive(letter):
    name = win32api.GetVolumeInformation(letter)
    totalSize, used, free = shutil.disk_usage(letter) 
    isNetwork = win32file.GetDriveType(letter) == win32file.DRIVE_REMOTE
    drive = Drive(letter, name[0], "{:.2f}".format(totalSize/(2**30)), "{:.2f}".format(free/(2**30)), isNetwork)
    return drive

def getProjects(letter):
    start = time.time()
    dirs = os.scandir(letter)
    folders = []
    projects = []
    for folder in dirs:
        if folder.is_dir() and not(folder.name.startswith('.')) and checkIsProject(folder.name):
            path_dir = Path(folder.path)
            size = "{:.2f}".format((sum(f.stat().st_size for f in path_dir.glob('**/*') if f.is_file())) / (2**20)) + " MB"
            mTime = time.ctime(os.path.getmtime(folder.path))
            folders.append([folder.name, mTime, size])
            #create object
            project = Project(folder.name, letter, mTime, size)
            print(project)
            projects.append(project)
    end = time.time()
    print("Execution time: ", end - start, " secs")
    return folders
drives = listAllDrives()

print(drives)

            
while True:
    letter = str(input("Drive to Scan(Type Quit to quit): "))
    letter = letter.upper()
    if letter == "QUIT":
        break
    if doesDriveExist(letter+':'):  
        print(selectDrive(letter+':\\'))
        projects = getProjects(letter+':\\') 
    else:
        print(letter, " => is not mounted")
    print("=======================================================\n")    
