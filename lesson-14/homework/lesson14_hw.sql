-- Easy Tasks
-- 1-task
-- Split the Name column by a comma into Name and Surname
select 
LEFT(Name, CHARINDEX(',',Name)-1) AS Name,
SUBSTRING(Name,CHARINDEX(',',Name)+1, LEN(Name)) AS Surname
from dbo.TestMultipleColumns;

-- 2-task
-- query to find strings from a table where the string itself contains the % character
SELECT *
FROM dbo.TestPercent
WHERE Strs LIKE '%\%%' ESCAPE '\';

-- 3-task
-- Split a string based on dot(.).(Splitter)
SELECT id, value AS part
FROM Splitter
CROSS APPLY STRING_SPLIT(Vals, '.');

-- 4-task
-- query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)
select *
from testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals,'.','')) >=2

-- 5-task
-- query to count the spaces present in the string.(CountSpaces)
select texts,
LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS space_count
from CountSpaces

-- 6-task
-- query that finds out employees who earn more than their managers.(Employee)
select e1.*, e2.Name as ManagerName, e2.Salary AS ManagerSalary
from Employee as e1
JOIN Employee as e2
ON e1.ManagerId = e2.id
WHERE e1.Salary > e2.Salary

-- 7-task
-- Find the employees who have been with the company for more than 10 years, but less than 15 years

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,
DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Years_of_Service
from Employees

-- Medium Tasks
-- 1-task
-- query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)

SELECT id, RecordDate, Temperature
FROM (
    SELECT 
        id,
        RecordDate,
        Temperature,
        LAG(Temperature) OVER (ORDER BY RecordDate) AS PrevTemp
    FROM Weather
) w
WHERE Temperature > PrevTemp;

-- 2-task
-- query that reports the first login date for each player.(Activity)
select *
From Activity a1
WHERE event_date = (select MIN(event_date) from Activity as a2
where a1.player_id = a2.player_id)

-- 3-task
-- task is to return the third item from that list.(fruits)
;with cte as(
SELECT value AS fruit_name,
ROW_NUMBER() OVER (ORDER by (select null)) AS row_num
FROM fruits
CROSS APPLY STRING_SPLIT(fruit_list, ',')
)
select fruit_name
FROM cte
WHERE row_num = 3