--1-task
BULK INSERT is a Transact-SQL (T-SQL) command in SQL Server that allows you to quickly import large volumes of data from a file (such as CSV, TXT, or other structured formats) directly into a database table or view
The main goal of BULK INSERT is to efficiently load external data into SQL Server, especially when:
- You have millions of rows to import.
- You want to avoid slow, iterative inserts.
- You need direct control over file format, delimiters, and batch sizes.
- You want to automate imports without using the SSMS Import Wizard.

--2-task
Here are four common file formats that can be imported into SQL Server using tools like BULK INSERT:
-CSV (Comma-Separated Values)
-TXT (Delimited Text)
-Native Format (.dat)
-XML.

--3-task
CREATE TABLE Products(
	ProductID INT PRIMARY KEY, 
	ProductName VARCHAR(50), 
	Price DECIMAL(10,2)
);

--4-task
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00);

--5-task
NULL - Represents missing, unknown, or undefined data.
NOT NULL  - A constraint that ensures a column must always have a value — it cannot be left empty.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,  -- Must always have a name
    Price DECIMAL(10,2) NULL           -- Price can be missing
);

--6-task
ALTER TABLE Products
ADD CONSTRAINT UQ_Products_ProductName UNIQUE (ProductName);

--7-task
-- Insert three sample products into the Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Wireless Mouse', 15.99),   -- ProductID 1: Mouse
    (2, 'Mechanical Keyboard', 45.50), -- ProductID 2: Keyboard
    (3, 'HD Monitor', 120.00);      -- ProductID 3: Monitor

--8-task
ALTER TABLE Products
ADD CategoryID INT;

--9-task
CREATE TABLE Categories (
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50) UNIQUE
);

--10-task
The main purpose of an IDENTITY column is to:
- Provide a unique, auto-generated value for each row (often used as a primary key).
- Simplify inserts by removing the need to manually track and assign IDs.
- Ensure sequential numbering based on a defined starting point (seed) and step size (increment).

--11-task
Bulk Insert Products
From 'C:\Users\javlo\Desktop\SQL\Lesson-3\products.csv'
with(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)


--12-task
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

--13-task
 PRIMARY KEY
- Purpose: Uniquely identifies each row in a table.
- Nulls: Does not allow NULL values — every row must have a value for the primary key column(s).
- Count per table: Only one PRIMARY KEY constraint is allowed per table (though it can be made up of multiple columns — a composite key).
- Index type: Creates a clustered index by default (unless one already exists).
- Foreign key reference: Commonly referenced by foreign keys in other tables to enforce relationships.
UNIQUE KEY
- Purpose: Ensures all values in the column(s) are unique, but does not necessarily identify the row as the table’s main identifier.
- Nulls: Allows one NULL value per column (in SQL Server).
- Count per table: You can have multiple UNIQUE constraints in a table.
- Index type: Creates a non‑clustered index by default (unless specified otherwise).
- Foreign key reference: Can also be referenced by foreign keys, but less common than PRIMARY KEY.

--14-task
ALTER TABLE Products
ADD CONSTRAINT CHK_Products_Price_Positive
CHECK (Price > 0);


--15-task
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

--16-task
UPDATE Products
SET Price = ISNULL(Price, 0);

--17-task
A FOREIGN KEY constraint is used to enforce referential integrity between two tables in a relational database.
It ensures that the value in one table’s column (the child table) must match an existing value in another table’s column (the parent table), usually the parent’s PRIMARY KEY or UNIQUE column

--18-task
--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
	Age INT NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
	--CHECK constraint ensuring Age >= 18
	CONSTRAINT CHK_Customers_Age_Adult CHECK (Age >= 18)
);

--19-task
--Create a table with an IDENTITY column starting at 100 and incrementing by 10.
CREATE TABLE Orders (
	OrderID INT IDENTITY(100,10) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	CustomerID INT NOT NULL,
	SaleAmount DECIMAL(10,2) NOT NULL
)


--20-task
CREATE TABLE OrderDetails (
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price DECIMAL(10,2),
	CONSTRAINT PK_OrderDetails PRIMARY KEY(OrderID, ProductID)
)


--21-task
COALESCE - Return the first non‑NULL value from a list of expressions.
ISNULL - Replace a NULL with a specified value.


--22-task
--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
CREATE TABLE Employees (
	EmpID INT PRIMARY KEY,
	Firstname VARCHAR(50),
	Lastname VARCHAR(50),
	Email VARCHAR(50) UNIQUE,
	HireDate DATE
)

--23-task
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;