--1-task
CREATE DATABASE lesson2hw
go
USE lesson2hw
CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
--2-task
INSERT INTO Employees (EmpID, Name, Salary) VALUES (1,'Ali Karimov', 8000);
INSERT INTO Employees (EmpID, Name, Salary) VALUES
(2, 'Nodira Abdullayeva', 6000),
(3, 'Nilufar Ergasheva', 3500);
--3-task
Update Employees
set Salary = 7000
where EmpID = 1
--4-task
DELETE FROM Employees
WHERE EmpID = 2
--5-task
/*
DELETE - Removes specific rows from a table based on a condition.
TRUNCATE - Removes all rows from a table quickly without logging individual row deletions.
DROP - Completely deletes the table (or other object) from the database.
*/
--6-task
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100)

--7-task
ALTER TABLE Employees
ADD Department VARCHAR(50)

--8-task
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT

--9-task
CREATE TABLE Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))

--10-task
TRUNCATE TABLE Employees