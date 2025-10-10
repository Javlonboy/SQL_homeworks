-- 1-task
-- Create a numbers table using a recursive query from 1 to 1000
;WITH cte AS (
    SELECT 1 AS i
    UNION ALL
    SELECT i + 1
    FROM cte
    WHERE i < 1000
)
SELECT i
FROM cte
OPTION (MAXRECURSION 1000);

-- 2-task
-- Write a query to find the total sales per employee using a derived table.(Sales, Employees)
SELECT e.*, s.total_sales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY EmployeeID
) AS s ON e.EmployeeID = s.EmployeeID;

-- 3-task
-- Create a CTE to find the average salary of employees.(Employees)
with cte as(
select AVG(salary) as average_salary
from employees
)
select average_salary
from cte;

-- 4-task
-- Write a query using a derived table to find the highest sales for each product.(Sales, Products)

SELECT p.ProductID, p.ProductName, s.max_sale
FROM Products AS p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS max_sale
    FROM Sales
    GROUP BY ProductID
) AS s ON p.ProductID = s.ProductID;

-- 5-task
-- Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.
WITH Doubles AS (
    SELECT 1 AS value
    UNION ALL
    SELECT value * 2
    FROM Doubles
    WHERE value * 2 < 1000000
)
SELECT value
FROM Doubles
OPTION (MAXRECURSION 20); 

-- 6-task
-- Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)
WITH cte AS (
    SELECT EmployeeID, COUNT(*) AS sale_count
    FROM Sales
    GROUP BY EmployeeID
    HAVING COUNT(*) > 5
)
SELECT e.*
FROM Employees e
JOIN cte ON e.EmployeeID = cte.EmployeeID;

-- 7-task
--Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)
WITH cte AS (
    SELECT ProductID, SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY ProductID
    HAVING SUM(SalesAmount) > 500
)
SELECT p.ProductID, p.ProductName, cte.total_sales
FROM Products p
JOIN cte ON p.ProductID = cte.ProductID;

-- 8-task
-- Create a CTE to find employees with salaries above the average salary.(Employees)
WITH cte AS (
    SELECT AVG(Salary) AS avg_salary
    FROM Employees
)
SELECT e.*
FROM Employees e
CROSS JOIN cte
WHERE e.Salary > cte.avg_salary;
