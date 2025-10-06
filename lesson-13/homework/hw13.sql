-- Easy Tasks
-- 1-task
-- query that outputs "100-Steven King", meaning emp_id + first_name + last_name
SELECT
CAST(EMPLOYEE_ID as varchar(30)) +'-'+ FIRST_NAME +' ' + LAST_NAME
FROM dbo.Employees

-- 2-task
-- Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
UPDATE dbo.Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999')

-- 3-task
-- Display the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'.
SELECT FIRST_NAME, LEN(FIRST_NAME) AS fname_length
FROM dbo.Employees
WHERE FIRST_NAME like 'A%'
OR FIRST_NAME like 'J%'
OR FIRST_NAME like 'M%'
ORDER BY FIRST_NAME

-- 4-task
-- Query to find the total salary for each manager ID.(Employees table)
SELECT MANAGER_ID,
SUM(SALARY) AS total_salary
FROM dbo.Employees
WHERE MANAGER_ID <>0
group by MANAGER_ID

-- 5-task
-- query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
SELECT Year1,
GREATEST(Max1,Max2, max3) as highest_value
FROM dbo.TestMax

-- 6-task
-- Find odd numbered movies and description is not boring.(cinema)
SELECT *
FROM dbo.Cinema
WHERE id % 2 = 1 AND description <> 'boring'

-- 7-task
--  sort data based on the Id but Id with 0 should always be the last row
SELECT *
FROM SingleOrder
ORDER BY case when id = 0 then 2
		 else 1 end

-- 8-task
-- query to select the first non-null value from a set of columns
SELECT id,
COALESCE(ssn, passportid, itin) AS first_non_null_value
FROM person

-- Medium Tasks
-- 1-task
-- Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
select
LEFT(Fullname, CHARINDEX(' ', Fullname)-1) AS Firstname,
SUBSTRING(Fullname,CHARINDEX(' ',Fullname) +1, CHARINDEX(' ',Fullname,CHARINDEX(' ',Fullname) + 1)-CHARINDEX(' ',Fullname)) AS Middlename,
RIGHT(Fullname, LEN(Fullname) - CHARINDEX(' ',Fullname,CHARINDEX(' ',Fullname) + 1)) AS Lastname
from Students

-- 2-task
-- For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
select *
from Orders AS o1
WHERE o1.DeliveryState = 'TX'
AND CustomerID IN (
	SELECT DISTINCT CustomerID
	FROM Orders as O2
	WHERE o2.DeliveryState = 'CA'
);

-- 3-task
-- SQL statement that can group concatenate the following values.(DMLTable)
select
STRING_AGG(String, ' ')
from DMLTable

-- 4-task
-- Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times
SELECT EMPLOYEE_ID,
CONCAT(FIRST_NAME, ' ', LAST_NAME) AS name
FROM dbo.Employees
WHERE LEN(LOWER(CONCAT(FIRST_NAME, ' ', LAST_NAME)))
- LEN(REPLACE(LOWER(CONCAT(FIRST_NAME, ' ', LAST_NAME)), 'a', '')) > 2

-- 5-task
-- The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)
SELECT DEPARTMENT_ID,
COUNT(EMPLOYEE_ID) AS number_of_emp,
100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END)
/ COUNT(*) AS Percentage_over_3_years
FROM dbo.Employees
GROUP BY DEPARTMENT_ID

