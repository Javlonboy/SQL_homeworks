--1-task
--Query that uses an alias to rename the ProductName column as Name in the Products table.
SELECT 
	ProductID,
	ProductName as Name,
	Price,
	Category,
	StockQuantity
FROM Products;

--2-task
--Query that uses an alias to rename the Customers table as Client for easier reference.
SELECT 
    Client.*
FROM Customers AS Client;

--3-task
--Combine results from two queries that select ProductName from Products and ProductName from Products_Discounted with UNION.
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;

--4-task
--Finding the intersection of Products and Products_Discounted tables using INTERSECT.
SELECT *
FROM Products
INTERSECT
SELECT *
FROM Products_Discounted;

--5-task
--Select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT
	FirstName,
	LastName,
	Country
FROM Customers;

--6-task
--SELECT with CASE, to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
SELECT *,
CASE WHEN Price > 1000 THEN 'High'
	 WHEN Price <= 1000 THEN 'Low'
	 END AS Price_Category
FROM Products;

--7-task
--Using IIF to create a column that shows 'Yes' if StockQuantity > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
SELECT *,
IIF(StockQuantity > 100, 'Yes', 'No') AS InStockOver100
FROM Products_Discounted;

--8-task
--Using UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted

--9-task
--Query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
SELECT *
FROM Products
EXCEPT
SELECT *
FROM Products_Discounted;

--10-task
--Creating a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
SELECT *,
IIF(Price > 1000, 'Expensive', 'Affordable') AS Price_Category
FROM Products;

--11-task
--Query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;

--12-task
--Updating the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;

--13-task
--Query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
SELECT *,
CASE WHEN SaleAmount > 500 THEN 'Top Tier'
	 WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
	 ELSE 'Low Tier' END AS Sale_Category
FROM Sales;

--14-task
--Using EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Sales table.
SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Sales;

--15-task
SELECT CustomerID, Quantity, 
CASE WHEN Quantity = 1 THEN 0.03 -- 3% discount
	 WHEN Quantity BETWEEN 1 AND 3 THEN 0.05 -- 5% discount
	 ELSE 0.07 END AS Discount_Percentage -- 7% discount
FROM Orders;