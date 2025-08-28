--1-task
SELECT MIN(Price) AS MinPrice
FROM dbo.Products;

--2-task
SELECT MAX(Salary) AS MaxSalary
FROM dbo.Employees;

--3-task
SELECT COUNT(*) AS RowNum
FROM dbo.Customers;

--4-task
SELECT COUNT(DISTINCT Category) AS UniqueCategoryCount
FROM dbo.Products;

--5-task
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE dbo.ProductID = 7;

--6-task
SELECT AVG(Age) AS EmployeesAverageAge
FROM dbo.Employees

--7-task
SELECT 
	DepartmentName,
	COUNT(EmployeeID) AS EmployeesNum
FROM dbo.Employees
GROUP BY DepartmentName
ORDER BY DepartmentName;

--8-task
SELECT
	Category,
	MIN(Price) AS MinimumPrice,
	MAX(Price) AS MaximumPrice
FROM dbo.Products
GROUP BY Category
ORDER BY Category;

--9-task
SELECT 
	CustomerID,
	SUM(SaleAmount) AS TotalSales
FROM dbo.Sales
GROUP BY CustomerID
ORDER BY CustomerID;

--10-task
SELECT 
	DepartmentName,
	COUNT(EmployeeID) AS EmployeesNum
FROM dbo.Employees
GROUP BY DepartmentName
HAVING COUNT(EmployeeID) > 5
ORDER BY EmployeesNum DESC;

--11-task
SELECT 
	Category,
	SUM(SaleAmount) AS TotalSales,
	AVG(SaleAmount) AS AverageSales
FROM dbo.Sales
LEFT JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Category
ORDER BY Category;

--12-task
SELECT
	COUNT(EmployeeID) AS HR_EmployeesNum
FROM dbo.Employees
WHERE DepartmentName = 'HR'

--13-task
SELECT
	DepartmentName,
	MAX(Salary) AS highestSalary,
	MIN(Salary) AS lowestSalary
FROM dbo.Employees
GROUP BY DepartmentName
ORDER BY DepartmentName;

--14-task
SELECT
	DepartmentName,
	AVG(Salary) AS averageSalary
FROM dbo.Employees
GROUP BY DepartmentName
ORDER BY DepartmentName;

--15-task
SELECT
	DepartmentName,
	AVG(Salary) AS averageSalary,
	COUNT(EmployeeID) AS numOfEmployees
FROM dbo.Employees
GROUP BY DepartmentName
ORDER BY DepartmentName;

--16-task
SELECT 
	Category,
	AVG(Price) AS averagePrice
FROM dbo.Products
GROUP BY Category
HAVING AVG(Price) > 400
ORDER BY Category;

--17-task
SELECT
	YEAR(SaleDate) AS salesYear,
	SUM(SaleAmount) AS totalSales
FROM dbo.Sales
GROUP BY YEAR(SaleDate)
ORDER BY salesYear;

--18-task
SELECT
	CustomerID,
	COUNT(OrderID) AS placedOrders
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 3
ORDER BY CustomerID;

--19-task
SELECT
	DepartmentName,
	AVG(Salary) AS averageSalary
FROM dbo.Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000
ORDER BY averageSalary DESC;

--20-task
SELECT
	Category,
	AVG(Price) AS averagePrice
FROM dbo.Products
GROUP BY Category
HAVING AVG(Price) > 150
ORDER BY averagePrice DESC;

--21-task
SELECT
	CustomerID,
	SUM(SaleAmount) AS totalSales
FROM dbo.Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500
ORDER BY totalSales DESC;


--22-task
SELECT
	DepartmentName,
	SUM(Salary) AS totalSalary,
	AVG(Salary) AS averageSalary
FROM dbo.Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000
ORDER BY averageSalary DESC;

