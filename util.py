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