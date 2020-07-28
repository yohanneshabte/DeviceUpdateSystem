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

    def watch(self, delay, running):
        event_handler = Handler()
        self.observer.schedule(event_handler, self.dir, recursive= False)
        self.observer.start()
        while running.is_set():
            print("Watching: ", self.dir)
            time.sleep(delay)
        print("not watching: ", self.dir)    
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



class CustomThread:
    def __init__(self, observer, delay):
        self.running = threading.Event()
        self.running.set()
        self.thread = threading.Thread(target=observer.watch, args = (delay, self.running))
        self.thread.start()

    def stop(self):
        self.running.clear()
        self.thread.join()
        print("thread closed")


obs = MyObserver("E:\\")    
obs2 = MyObserver("C:\\users\\yohannes\\Documents")  
watchables = [obs, obs2]
threads = []
for obs in watchables:
    threads.append(CustomThread(obs, 2))   
try:
    while True:
        time.sleep(.1)
except KeyboardInterrupt:
    for thread in threads:
        thread.stop()