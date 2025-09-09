--1-task
--Report the first name, last name, city, and state of each person in the Person table
Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT
	p.firstName,
	p.lastName,
	ISNULL(a.city,'Null') AS city,
	ISNULL(a.state, 'Null') AS state
FROM Person AS p
LEFT JOIN Address AS a
ON p.personId = a.personId

--2-task
--Finding the employees who earn more than their managers
Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

SELECT 
	e1.id,
	e1.name,
	e1.salary,
	e1.managerId
FROM Employee as e1
LEFT JOIN Employee as e2
ON e1.managerId = e2.id
where e1.salary > e2.salary;

--3-task
--Report all the duplicate emails.
CREATE TABLE Person (
	id INT PRIMARY KEY,
	email VARCHAR(255) NOT NULL
	CONSTRAINT chk_email_lowercase
		CHECK (email = LOWER(email))
);
TRUNCATE TABLE Person;
INSERT INTO Person (id, email) VALUES
	(1, 'a@b.com'),
	(2, 'c@d.com'),
	(3, 'a@b.com');

SELECT email as Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1

--4-task
--Delete all duplicate emails, keeping only one unique email with the smallest id
CREATE TABLE Person (
	id INT PRIMARY KEY,
	email VARCHAR(255) NOT NULL
	CONSTRAINT chk_email_lowercase
		CHECK (email = LOWER(email))
);
INSERT INTO Person (id, email) VALUES
	(1, 'john@example.com'),
	(2, 'bob@example.com'),
	(3, 'john@example.com');
DELETE p1
FROM Person AS p1
JOIN Person AS p2
    ON p1.email = p2.email
   AND p1.id > p2.id;
SELECT * FROM Person;

--5-task
--Find those parents who has only girls.
CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

SELECT DISTINCT g.ParentName
FROM girls as g
LEFT JOIN boys as b
ON g.ParentName = b.ParentName
WHERE b.id is null

--6-task
--Find total Sales amount for the orders which weights more than 50 for each customer along with their least weight.
--(from TSQL2012 database, Sales.Orders Table)
SELECT
	o.custid,
	SUM(od.unitprice * od.qty*od.discount) AS total_sales_amount,
	MIN(o.freight) AS least_weight
FROM Sales.Orders AS o
JOIN Sales.OrderDetails AS od
ON o.orderid = od.orderid
GROUP BY o.custid
HAVING SUM(o.freight) > 50

--7-task

DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

SELECT ISNULL(Cart1.Item,'') as [Item Cart 1], ISNULL(Cart2.Item,'') as [Item Cart 2]
FROM Cart1
FULL JOIN Cart2
ON Cart1.Item = Cart2.Item
ORDER BY [Item Cart 1] DESC

--8-task
--Finding all customers who never order anything.
Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

SELECT c.name
FROM Customers as c
LEFT JOIN Orders as o
ON c.id = o.customerId
WHERE o.id is null

--9-task
--Finding the number of times each student attended each exam

Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

SELECT 
	s.student_id,
	s.student_name,
	sub.subject_name,
COUNT(e.subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects as sub
LEFT JOIN Examinations AS e
ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id,
		 s.student_name,
		 sub.subject_name
