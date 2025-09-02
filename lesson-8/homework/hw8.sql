--1-task
SELECT
	Category,
	COUNT(ProductID) AS num_product
FROM dbo.Products
GROUP BY Category
ORDER BY num_product DESC;

--2-task
SELECT AVG(Price) AS electronics_average_price
FROM dbo.Products
WHERE Category = 'Electronics';

--3-task
SELECT *
FROM dbo.Customers
WHERE City like 'L%'

--4-task
SELECT * 
FROM dbo.Products
WHERE ProductName like '%er'

--5-task
SELECT * 
FROM dbo.Customers
WHERE Country like '%A'

--6-task
SELECT top (1) *
FROM dbo.Products
ORDER BY Price DESC;

--7-task
SELECT *,
CASE WHEN StockQuantity < 30 then 'Low Stock'
	ELSE 'Suffucient' END AS stock_label
FROM dbo.Products
ORDER BY StockQuantity;

--8-task
SELECT 
Country,
COUNT(CustomerID) AS total_num_of_customers
FROM dbo.Customers
GROUP BY Country
ORDER BY total_num_of_customers DESC;

--9-task

SELECT MIN(Quantity) AS minimum_quantity_order ,
MAX(Quantity) AS maximum_quantity_order
FROM dbo.Orders


--10-task
SELECT Orders.CustomerID
FROM Orders
JOIN Invoices
ON Orders.CustomerID = Invoices.CustomerID
WHERE Orders.OrderDate >='2023-01-01' AND  Orders.OrderDate < '2023-02-01'

--11-task
SELECT ProductName
FROM dbo.Products
UNION ALL
SELECT ProductName
FROM dbo.Products_Discounted

--12-task
SELECT ProductName
FROM dbo.Products
UNION
SELECT ProductName
FROM dbo.Products_Discounted


--13-task
SELECT
YEAR(OrderDate),
AVG(TotalAmount) AS average_order
FROM dbo.Orders
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

--14-task
SELECT
	ProductName,
	CASE WHEN Price < 100 THEN 'Low'
		 WHEN Price BETWEEN 100 and 500 THEN 'Mid'
		 WHEN Price > 500 THEN 'High' 
	END AS pricegroup
FROM Products
ORDER BY Pricegroup;

--15-task
SELECT district_id, district_name, [2012], [2013] into Population_Each_Year
FROM city_population
PIVOT
(
SUM(population) for year in ([2012],[2013])
) as pivoted_table

--16-task
--Using Sales table, find total sales per product Id.
SELECT ProductID,
SUM(SaleAmount) AS total_sales
FROM dbo.Sales
GROUP BY ProductID
ORDER BY ProductID;
--17-task
--Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
SELECT ProductName
FROM dbo.Products
WHERE ProductName LIKE '%oo%'

--18-task
SELECT year, Bektemir, Chilonzor, Mirobod, Yakkasaroy, Yashnobod
INTO Population_Each_City
FROM (SELECT year, district_name, population FROM City_population) AS City_population
PIVOT
(
SUM(population) FOR district_name in (Bektemir, Chilonzor,Mirobod,Yakkasaroy,Yashnobod)
) as pivoted_table

--19-task
SELECT top (3) with ties CustomerID,
SUM(TotalAmount) AS Totalspent
FROM dbo.Invoices
GROUP BY CustomerID
ORDER BY Totalspent DESC;

--20-task
SELECT district_id, district_name, population, year
FROM dbo.Population_Each_Year
UNPIVOT(
population for year in ([2012], [2013])
) AS unpivoted_table
ORDER BY year, district_id

--21-task
SELECT p.ProductName,
COUNT(s.saleid) AS sold_number_of_times
FROM Products AS p
JOIN Sales AS s
ON p.ProductID = s.ProductID
GROUP BY p.ProductName

--22-task

SELECT district_name, population, year
FROM dbo.Population_Each_City
UNPIVOT(
population for district_name in (Bektemir, Chilonzor, Mirobod, Yakkasaroy, Yashnobod)
) AS unpivoted_table
ORDER BY year

