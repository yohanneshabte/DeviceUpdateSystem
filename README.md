#### To get Folder size without access to escalated permission try this
##### check and benchmark the speed vs the existing algo
``` python
import win32com.client as com

folderPath = r"D:\Software\Downloads"
fso = com.Dispatch("Scripting.FileSystemObject")
folder = fso.GetFolder(folderPath)
MB = 1024 * 1024.0
print("%.2f MB" % (folder.Size / MB))
```

### Drive System with Python
- https://stackoverflow.com/questions/50528180/list-drives-and-network-locations-in-python-windows
- https://stackoverflow.com/questions/54458308/how-to-get-disk-space-total-used-and-free-using-python-2-7-without-psutil
- https://blog.magrathealabs.com/filesystem-events-monitoring-with-python-9f5329b651c3
- http://timgolden.me.uk/python/win32_how_do_i/watch_directory_for_changes.html
- https://stackoverflow.com/questions/40499753/windows-volume-get-size-free-space
- https://stackoverflow.com/questions/827371/is-there-a-way-to-list-all-the-available-drive-letters-in-python
- https://stackoverflow.com/questions/44970700/python-2-get-network-share-path-from-drive-letter
- https://stackoverflow.com/questions/182197/how-do-i-watch-a-file-for-changes
- https://stackoverflow.com/questions/800197/how-to-get-all-of-the-immediate-subdirectories-in-python
- https://stackoverflow.com/questions/10960477/how-to-read-file-attributes-in-directory
- https://stackoverflow.com/questions/51299026/how-can-i-get-information-on-a-files-propertiesdetails-using-python
- https://stackoverflow.com/questions/237079/how-to-get-file-creation-modification-date-times-in-python
- https://stackoverflow.com/questions/973473/getting-a-list-of-all-subdirectories-in-the-current-directory/38245063
- https://stackoverflow.com/questions/1392413/calculating-a-directorys-size-using-python
- https://stackoverflow.com/questions/2485719/very-quickly-getting-total-size-of-folder
- https://kite.com/python/answers/how-to-list-immediate-subdirectories-in-python
- http://www.ironpython.info/index.php?title=WMI_with_IronPython
#### threading/background services
- https://medium.com/@bfortuner/python-multithreading-vs-multiprocessing-73072ce5600b
- https://stackoverflow.com/questions/23100704/running-infinite-loops-using-threads-in-python
- https://stackoverflow.com/questions/47966717/python-running-main-thread-continuously-and-while-running-others-in-background
- https://stackoverflow.com/questions/15847717/how-to-run-and-stop-an-infinite-loop-in-a-python-thread
- https://stackoverflow.com/questions/32404/how-do-you-run-a-python-script-as-a-service-in-windows
- https://stackoverflow.com/questions/41375247/how-to-run-python-script-in-windows-backround
- http://thepythoncorner.com/dev/how-to-create-a-windows-service-in-python/
#### Watchdog
- https://stackoverflow.com/questions/18599339/python-watchdog-monitoring-file-for-changes
- https://stackoverflow.com/questions/32092645/python-watchdog-windows-wait-till-copy-finishes

### MySQL & Python
 #### Setup MySQL and PhpMyAdmin
- https://dev.mysql.com/doc/refman/8.0/en/windows-installation.html
- https://www.bogotobogo.com/php/phpMyAdmin_Install_On_Windows.php
- https://stackoverflow.com/questions/49008576/can-i-host-my-own-mysql-database
 #### Connecting MySQL and Python
- https://stackoverflow.com/questions/372885/how-do-i-connect-to-a-mysql-database-in-python
- https://dev.mysql.com/doc/connector-python/en/connector-python-example-connecting.html
 #### Stored Procedure using Python
- https://pynative.com/python-mysql-execute-stored-procedure/
 #### Creating SP and triggers in MYSQL(with PHPMyAdmin)
- https://medium.com/mobiosolutions/create-stored-procedures-in-php-myadmin-ccf02c323a7e 
- https://dev.mysql.com/doc/refman/8.0/en/triggers.html
- https://stackoverflow.com/questions/17869629/how-to-create-a-mysql-trigger-in-phpmyadmin
