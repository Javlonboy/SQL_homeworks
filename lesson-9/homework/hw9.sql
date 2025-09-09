--1-task
--Using Products, Suppliers table List all combinations of product names and supplier names.
SELECT 
	p.ProductName,
	s.SupplierName
FROM Products AS p
CROSS JOIN Suppliers AS s;

--2-task
--Using Departments, Employees table Get all combinations of departments and employees.
SELECT
	d.DepartmentName,
	e.Name
FROM Departments AS d
CROSS JOIN Employees AS e;

--3-task
--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. 
--Return supplier name and product name
SELECT
	s.SupplierName,
	p.ProductName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID;

--4-task
--Using Orders, Customers table List customer names and their orders ID.
SELECT
	c.FirstName,
	c.LastName,
	o.OrderID
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

--5-task
--Using Courses, Students table Get all combinations of students and courses.
SELECT
	s.Name,
	c.CourseName
FROM Courses AS c
CROSS JOIN Students AS s;

--6-task
--Using Products, Orders table Get product names and orders where product IDs match.
SELECT
	p.ProductName,
	o.OrderID
FROM Products AS p
INNER JOIN Orders AS o
ON p.ProductID = o.ProductID;

--7-task
--Using Departments, Employees table List employees whose DepartmentID matches the department.
SELECT
	e.Name,
	d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID;

--8-task
--Using Students, Enrollments table List student names and their enrolled course IDs.
SELECT
	s.Name,
	e.CourseID
FROM Students AS s
INNER JOIN Enrollments AS e
ON s.StudentID = e.StudentID;

--9-task
--Using Payments, Orders table List all orders that have matching payments.
SELECT
	p.OrderID,
	o.OrderDate,
	o.CustomerID,
	p.PaymentID,
	p.PaymentDate,
	p.Amount
FROM Payments AS p
INNER JOIN Orders AS o
ON p.OrderID = o.OrderID;

--10-task
--Using Orders, Products table Show orders where product price is more than 100.
SELECT 
	o.OrderID,
	o.CustomerID,
	o.ProductID,
	p.ProductName,
	o.OrderDate,
	o.Quantity,
	p.Price,
	o.TotalAmount
FROM Orders AS o
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
WHERE p.Price > 100;

--11-task
--Using Employees, Departments table List employee names and department names where department IDs are not equal. 
--It means: Show all mismatched employee-department combinations.
SELECT 
	e.Name,
	d.DepartmentName
FROM Employees AS e
CROSS JOIN Departments AS d
WHERE e.DepartmentID <> d.DepartmentID
ORDER BY e.Name, d.DepartmentName;

--12-task
--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
SELECT 
	o.OrderID,
	o.CustomerID,
	o.ProductID,
	p.ProductName,
	o.OrderDate,
	o.Quantity,
	p.StockQuantity
FROM Orders AS o
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity

--13-task
--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
SELECT 
	c.FirstName,
	c.LastName,
	s.ProductID,
	s.SaleAmount
FROM Customers AS c
INNER JOIN Sales AS s
ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500;

--14-task
--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
SELECT
	s.Name,
	c.CourseName
FROM Students AS s
INNER JOIN Enrollments AS e
ON s.StudentID = e.StudentID
INNER JOIN Courses AS c
ON c.CourseID = e.CourseID;

--15-task
--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
SELECT
	p.ProductName,
	s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

--16-task
--Using Orders, Payments table Show orders where payment amount is less than total amount.
SELECT
	o.OrderID,
	o.CustomerID,
	o.OrderDate,
	o.TotalAmount,
	p.Amount as PaymentAmount
FROM Orders AS o
INNER JOIN Payments AS p
ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

--17-task
--Using Employees and Departments tables, get the Department Name for each employee.
SELECT
	e.Name,
	ISNULL(d.DepartmentName, 'Department Not Assigned')
FROM Employees AS e
LEFT JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID;

--18-task
--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
SELECT 
	p.ProductID,
	p.ProductName,
	c.CategoryName,
	p.Price,
	p.StockQuantity,
	p.SupplierID
FROM Products AS p
INNER JOIN Categories AS c
ON p.Category = c.CategoryID
WHERE c.CategoryName in ('Electronics','Furniture')


--19-task
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
SELECT 
	s.SaleID,
	s.ProductID,
	s.CustomerID,
	s.SaleDate,
	s.SaleAmount,
	c.FirstName,
	c.LastName,
	c.Country
FROM Sales AS s
INNER JOIN Customers AS c
ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA'
ORDER BY s.SaleDate;

--20-task
--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
SELECT 
	o.OrderID,
	o.CustomerID,
	c.FirstName,
	c.LastName,
	c.Country,
	o.TotalAmount
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100

--21-task
--Using Employees table List all pairs of employees from different departments.
SELECT *
FROM Employees AS e1
INNER JOIN Employees AS e2
ON e1.EmployeeID = e2.EmployeeID

SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.DepartmentID AS Department1,
    e2.DepartmentID AS Department2
FROM Employees AS e1
INNER JOIN Employees AS e2
    ON e1.EmployeeID < e2.EmployeeID
   AND e1.DepartmentID <> e2.DepartmentID
ORDER BY e1.Name, e2.Name;


--22-task
--Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
SELECT 
	pm.PaymentID,
	pm.PaymentDate,
	pm.OrderID,
	pm.Amount,
	pm.PaymentMethod,
	o.Quantity * p.Price AS OrderAmount
FROM Payments AS pm
INNER JOIN Orders AS o
ON pm.OrderID = o.OrderID
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
WHERE pm.Amount != o.Quantity * p.Price

--23-task
--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
SELECT
	s.StudentID,
	s.Name,
	s.Age,
	s.Major
FROM Students AS s
FULL JOIN Enrollments AS e
ON s.StudentID = e.StudentID
FULL JOIN Courses AS c
ON e.CourseID = c.CourseID
WHERE e.StudentID IS NULL;


--24-task
--Using Employees table List employees who are managers of someone, 
--but their salary is less than or equal to the person they manage.
SELECT DISTINCT
	e2.EmployeeID,
	e2.Name,
	e2.DepartmentID,
	e2.Salary
FROM Employees AS e1
LEFT JOIN Employees AS e2
ON e1.managerId = e2.EmployeeID
where e1.salary > e2.salary

--25-task
--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
SELECT 
	c.*, 
	o.OrderID,
	o.ProductID,
	o.OrderDate,
	o.Quantity,
	o.TotalAmount
FROM Orders AS o
LEFT JOIN Payments AS p
ON o.OrderID = p.OrderID
INNER JOIN Customers AS C
ON o.CustomerID = c.CustomerID
WHERE p.PaymentID IS NULL