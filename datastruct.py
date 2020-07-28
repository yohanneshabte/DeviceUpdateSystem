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
            print(Fore.CYAN + 'Adding to DB: ' + sql)
            db.execute(sql)
            db.commit()
        except:
            print(Fore.RED + self.projectID + ': failed to be added to DB')  

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
        print(Fore.CYAN + 'Committing: ' + sql)
        db.execute(sql)
        if 'Y' == str(input('Are you sure you want to add the drive to the DB?(Y/N): ')):
            db.commit()
            print(Fore.GREEN + 'Drive successfully added to DB') 