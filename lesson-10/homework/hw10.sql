--1-task
--Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
SELECT 
	e.Name,
	e.Salary,
	d.DepartmentName
FROM Employees as e
INNER JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
WHERE e.salary > 50000
ORDER BY e.Name;

--2-task
--Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023
SELECT 
	c.FirstName,
	c.LastName,
	o.OrderDate
FROM Customers AS c
JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

--3-task
--Using the Employees and Departments tables, 
--write a query to show all employees along with their department names. 
--Include employees who do not belong to any department.
SELECT 
	e.Name,
	d.DepartmentName
FROM Employees AS e
LEFT JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID;

--4-task
--Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. 
--Show suppliers even if they don’t supply any product.
SELECT 
	SupplierName,
	ProductName
FROM Products AS p
RIGHT JOIN Suppliers as s
ON p.SupplierID=s.SupplierID;

--5-task
--Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. 
--Include orders without payments and payments not linked to any order.
SELECT
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
FROM Orders AS o
FULL JOIN Payments AS p
ON o.OrderID = p.OrderID;

--6-task
--Using the Employees table, write a query to show each employee's name along with the name of their manager.
SELECT 
	e1.Name AS EmployeeName,
	e2.Name AS ManagerName
FROM Employees AS e1
LEFT JOIN Employees AS e2
ON e1.ManagerID = e2.EmployeeID;

--7-task
--Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
SELECT
	s.Name AS StudentName,
	c.CourseName
FROM Students AS s
JOIN Enrollments AS e
ON s.StudentID = e.StudentID
JOIN Courses AS c
ON e.CourseID = c.CourseID
WHERE CourseName = 'Math 101';


--8-task
--Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. 
--Return their name and the quantity they ordered.
SELECT
	c.FirstName,
	c.LastName,
	o.Quantity
FROM Customers AS c
JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;

--9-task
--Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
SELECT
	e.Name AS EmployeeName,
	d.DepartmentName
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';

--10-task
--Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
SELECT
	d.DepartmentName,
	COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;

--11-task
--Using the Products and Sales tables, write a query to find products that have never been sold.
SELECT
	p.ProductID,
	p.ProductName
FROM Products AS p
LEFT JOIN Sales AS s
ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

--12-task
--Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
SELECT
	c.FirstName,
	c.LastName,
	COUNT(o.OrderID) AS TotalOrders
FROM Customers AS c
JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName,
		 c.LastName
ORDER BY c.FirstName, c.LastName;

--13-task
--Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
SELECT
	e.Name AS EmployeeName,
	d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID;

--14-task
--Using the Employees table, write a query to find pairs of employees who report to the same manager.
SELECT
	e1.Name AS Employee1,
	e2.Name Employee2,
	e1.ManagerID
FROM Employees AS e1
JOIN Employees AS e2
ON e1.ManagerID = e2.ManagerID
AND e1.EmployeeID < e2.EmployeeID;


--15-task
--Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
SELECT
	o.OrderID,
	o.OrderDate,
	c.FirstName,
	c.LastName
FROM Orders AS o
LEFT JOIN Customers AS c
ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;

--16-task
--Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
SELECT
	e.Name AS EmployeeName,
	e.Salary,
	d.DepartmentName
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' AND e.Salary > 60000;


--17-task
--Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
SELECT
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
FROM Orders AS o
JOIN Payments AS p
ON o.OrderID = p.OrderID
WHERE o.TotalAmount = p.Amount;

--18-task
--Using the Products and Orders tables, write a query to find products that were never ordered.
SELECT
	p.ProductID,
	p.ProductName
FROM Products AS p
LEFT JOIN Orders AS o
ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL