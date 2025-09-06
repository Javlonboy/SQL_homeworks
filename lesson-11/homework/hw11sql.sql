--1-task
SELECT o.OrderID, c.Firstname +' ' + c.Lastname as CustomerName, o.OrderDate 
FROM dbo.Orders as o
INNER JOIN dbo.Customers as c
ON o.CustomerID = c.CustomerID
WHERE YEAR(o.Orderdate) > '2022'
ORDER BY YEAR(OrderDate);


--2-task
SELECT e.Name as EmployeeName, d.DepartmentName
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'Sales' or DepartmentName = 'Marketing'
ORDER BY DepartmentName;

--3-task
SELECT d.DepartmentName, 
MAX(Salary) as MaxSalary
FROM Departments as d
JOIN Employees as e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY MaxSalary DESC;

--4-task
SELECT c.Firstname + ' ' + c.Lastname as CustomerName, o.OrderID, o.OrderDate
FROM Customers as c
JOIN Orders as o
ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = '2023'
ORDER BY CustomerName;


--5-task
SELECT c.Firstname + ' ' + c.Lastname as CustomerName, 
COUNT(o.CustomerID) as TotalOrders
FROM Orders as o
JOIN Customers as c
ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY CustomerName;

--6-task
SELECT p.ProductName, s.SupplierName
FROM Products as p
JOIN Suppliers as s
ON p.SupplierID = s.SupplierID
WHERE s.SupplierName = 'Gadget Supplies' or s.SupplierName = 'Clothing Mart'
ORDER BY s.SupplierName;

--7-task
SELECT c.Firstname + ' ' + c.Lastname as CustomerName, 
MAX(OrderDate) as MostRecentOrderDate
FROM Customers as c
LEFT JOIN Orders as o
ON c.CustomerID = o.CustomerID
GROUP BY c.Firstname, c.Lastname
ORDER BY CustomerName;

--8-task
SELECT 
	c.Firstname + ' ' + c.Lastname as CustomerName, 
	SUM(TotalAmount) as OrderTotal
FROM Orders AS o
JOIN Customers AS c
ON c.CustomerID = o.CustomerID
GROUP BY c.Firstname, c.Lastname
HAVING SUM(TotalAmount) > 500
ORDER BY OrderTotal DESC;

--9-task
SELECT p.ProductName, s.SaleDate, s.SaleAmount
FROM Products as p
JOIN Sales as s
ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = '2022' OR SaleAmount > 400;


--10-task
SELECT p.ProductName,
SUM(SaleAmount) as TotalSalesAmount
FROM Sales as s
JOIN Products as p
ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TotalSalesAmount DESC;

--11-task
SELECT e.Name as EmployeeName, d.DepartmentName, e.Salary
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary > 60000
ORDER by Salary DESC;

--12-task
SELECT p.ProductName, s.SaleDate, p.StockQuantity
FROM Products as p
JOIN Sales as s
ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = '2023' AND p.StockQuantity > 100;

--13-task
SELECT e.Name as EmployeeName, d.DepartmentName, e.HireDate
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > '2020'
Order by DepartmentName;

