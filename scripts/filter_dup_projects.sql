SELECT SUBSTRING_INDEX(`projectID`,'_', -1) AS `PROJECT ID`, 
       GROUP_CONCAT(`ProjectName`) AS `List of Project Names`, 
       GROUP_CONCAT(`projectLocation`) AS `List of Project Locations`, 
       COUNT(ProjectID) AS `No of Duplicates` 
FROM project 
GROUP BY `PROJECT ID` 
HAVING count(ProjectID) > 1
