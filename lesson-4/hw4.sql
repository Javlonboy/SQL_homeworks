--1-task
SELECT TOP 5 * FROM Employees

--2-task
SELECT DISTINCT Category FROM Products

--3-task
SELECT * FROM Products
WHERE Price > 100

--4-task
SELECT * FROM Customers
WHERE Firstname LIKE 'A%'

--5-task
SELECT * FROM Products
ORDER BY Price

--6-task
SELECT * FROM Employees
WHERE Salary >= 60000 AND Department = 'HR'

--7-task

SELECT ISNULL(Email, 'noemail@example.com') AS Email FROM Employees

--8-task
SELECT * FROM Products
WHERE Price BETWEEN 50 AND 100

--9-task
SELECT DISTINCT Category,ProductName FROM Products

--10-task
SELECT DISTINCT Category,ProductName FROM Products
ORDER BY ProductName DESC

--11-task
SELECT TOP 10 WITH TIES* FROM Products
ORDER BY Price DESC

--12-task
SELECT COALESCE(FirstName, LastName, 'Unnamed Employee') AS PreferredName FROM Employees

--13-task
SELECT DISTINCT Category,Price FROM Products

--14-task
SELECT * FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR Department = 'Marketing'

--15-task
SELECT * FROM Employees
ORDER BY Salary DESC OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY

--16-task
SELECT * FROM Products
WHERE Price <= 1000 AND Stock > 50
ORDER BY Stock

--17-task
SELECT * FROM Products
WHERE ProductName LIKE '%e%'

--18-task
SELECT * FROM Employees
WHERE Department IN ('HR','IT','Finance')

--19-task
SELECT *
FROM Customers
ORDER BY City, PostalCode DESC

--20-task
SELECT TOP 5 WITH TIES * FROM Products
ORDER BY SalesAmount DESC

--21-task
SELECT FirstName + ' ' + LastName AS FullName FROM Employees

--22-task
SELECT DISTINCT Category, ProductName, Price FROM Products
WHERE Price > 50

--23-task
SELECT * FROM Products
WHERE Price < 0.1 * (SELECT AVG(Price) FROM Products)