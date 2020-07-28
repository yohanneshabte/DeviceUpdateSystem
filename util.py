import math
import time

def convertSize(bits):
    if bits == 0:
        return "0B"
    sizeType = ("B","KB","MB","GB","TB","PB")
    i = int(math.floor(math.log(bits, 1024)))
    p = math.pow(1024, i)
    s = round(bits / p, 2)
    if i > len(sizeType) - 1:
        return "excessive size(greater than 1000 TB)"
    return str(s) + sizeType[i]

def convertTime(input):
    try:
        inputTime = time.strptime(input, "%m/%d/%y")
        result = time.strftime('%Y-%m-%d %H:%M:%S', inputTime)
    except:
        print('Wrong Date')
        result = None
    return result

def getNetworkDrives():
    #get network drives that may not be mapped
    resume = 0
    while 1:
        (_drives, total, resume) = win32net.NetUseEnum(None, 0, resume)
        for drive in _drives:
            if drive['local']:
                print(drive['local'], "=>", drive['remote'])
        if not resume: break

def listAllDrives():
    localDrives = win32api.GetLogicalDriveStrings()
    drives = localDrives.split('\\\x00')
    while '' in drives:
        drives.remove('')
    return drives

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