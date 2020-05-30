#listAllDrives(): list
#selectDrive(name)
#getDriveInfo() : object/list
#getProjects() : object


class Project:
    name = ""
    dev = ""
    date = ""
    def __init__(self, name, dev, date):
        self.name = name
        self.dev = dev
        self.date = date

class Drive:
    letter = ""
    name = ""
    totalSize = 0
    freeSpace = 0
    driveType = ""
    def __init__(self, letter, name, totalSize, freeSpace, driveType):
        self.letter = letter
        self.name = name
        self.totalSize = totalSize
        self.freeSpace = freeSpace
        self.driveType = driveType

