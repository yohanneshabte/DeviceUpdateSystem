import sys
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

import threading
class MyObserver:
    dir = ""
    
    def __init__(self, dir):
        self.dir = dir
        self.observer = Observer()

    def watch(self):
        event_handler = Handler()
        self.observer.schedule(event_handler, self.dir, recursive= False)
        self.observer.start()
        try:
            while True:
                print("Watcjomg: ", self.dir)
                time.sleep(3)
        except:
            self.observer.stop()
        self.observer.join()    

class Handler(FileSystemEventHandler):
    @staticmethod
    def on_any_event(event):   
        if event.event_type == 'created':
            print("Project created: ", event.src_path)
        elif event.event_type == 'deleted':
            print("Project has been deleted from: ", event.src_path)
        elif event.event_type == 'moved':
            print("Project has been moved from: ", event.src_path, " to: ", event.dest_path)    
            
obs = MyObserver("Z:\My_Private_Files")    
obs2 = MyObserver("C:\\users\\yohannes\\Documents")  

threads = []
