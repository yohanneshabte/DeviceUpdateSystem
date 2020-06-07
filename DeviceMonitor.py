import socket
import win32.win32service as win32service
import win32.win32event as win32event
import win32.servicemanager as servicemanager
import win32.lib.win32serviceutil as win32serviceutil
import win32.win32api as win32api
import time
import logging
from win10toast import ToastNotifier
import mysql.connector
from db import DB

toaster = ToastNotifier()
db = DB()
def listAllDrives():
    localDrives = win32api.GetLogicalDriveStrings()
    drives = localDrives.split('\\\x00')
    while '' in drives:
        drives.remove('')
    return drives

class DeviceMonitor(win32serviceutil.ServiceFramework):
    _svc_name_ = "DeviceUpdateSystem"
    _svc_display_name_ = "Device Update System"
    _svc_description_ = "Near storage, cold storage, and archive tracker and updater for MNSU"

    watchingDrives = []
    isRunning = True
    @classmethod
    def parse_command_line(cls):
        win32serviceutil.HandleCommandLine(cls)
    
    def __init__(self, args):
        win32serviceutil.ServiceFramework.__init__(self, args)
        self.hWaitStop = win32event.CreateEvent(None, 0, 0, None)
        self.isRunning = True
        socket.setdefaulttimeout(60)

    def SvcStop(self):
        self.stop()
        self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
        win32event.SetEvent(self.hWaitStop)
    

    def SvcDoRun(self):
        self.start()
        servicemanager.LogMsg(servicemanager.EVENTLOG_INFORMATION_TYPE,
                              servicemanager.PYS_SERVICE_STARTED,
                              (self._svc_name_, ''))
        self.main()

    def start(self):
        self.isRunning = True
        print("starting to monitor for usb")

    def stop(self):
        self.isRunning = False
        print("Stopped monitoring for usb")
 
    def main(self):
        drives = listAllDrives()
        while self.isRunning:
            drives1 = listAllDrives()
            print(drives1)
            if len(drives1) > len(drives):
                s = set(drives)
                new = [x for x in drives1 if x not in s]
                self.driveInserted(new)
                drives = drives1
            elif len(drives1) < len(drives):  
                s = set(drives1)
                new = [x for x in drives if x not in s]
                self.driveRemoved(new)
                drives = drives1  
            time.sleep(3)

    # monitor all existing network drives for changes and log accordingly
    # runs during life of service
    '''
    Monitored data
        - changes to drive(created, deleted, renamed events) - update projects table
        - size changes to drive - update drives table
    '''
    def monitorNearStorage():
        pass

    # monitor given cold storage or archive drives for changes and log accordingly
    # starts running when drive is inserted and stops when drive is removed
    '''
    Monitored data
        - changes to drive(created, deleted, renamed events) - update projects table
        - size changes to drive - update drive table
    '''
    def monitorExternalStorage(letter):
        pass    
    
    # backup test for len(drives1)<len(drives) to test if drive is still mounted 
    # called in loop to monitor if drive is still available and monitoring should continue
    def isDeviceAvailable(letter):
        pass

    def driveInserted(self, letters):
        for letter in letters:
            db.execute("INSERT INTO log VALUES(0, '"+str(letter)+" drive inserted', '" + time.strftime('%Y-%m-%d %H:%M:%S') + "');")
            db.commit()
            monitorExternalStorage(letter)
        self.watchingDrives.append("a")

    def driveRemoved(self, letters):
        for letter in letters:
            db.execute("INSERT INTO log VALUES(0, '"+str(letter)+" drive removed', '" + time.strftime('%Y-%m-%d %H:%M:%S') + "');")
            db.commit()
        self.watchingDrives.remove("a")


if __name__ == '__main__':
    DeviceDetector.parse_command_line()
