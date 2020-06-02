class Project:
    name = ""
    dev = ""
    date = ""
    def __init__(self, name, dev, date):
        self.name = name
        self.dev = dev
        self.date = date
    def __eq__(self, other):
        if not isinstance(other, Project):
            return NotImplemented
        return self.name == other.name        
    @staticmethod
    def isValid(proj):
        pass
    
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
