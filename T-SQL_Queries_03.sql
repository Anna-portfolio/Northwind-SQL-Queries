-- T-SQL queries by @Anna-Portfolio --https://github.com/anna-portfolio
--OPERATIONS ON TABLES: JOIN, GROUP BY, ORDER BY, HAVING, ALIASES


--list all data from the Order Details table and the product ID, product name and unit price from the Products table
--(ProductID, ProductName, and UnitPrice columns from the Products table).
SELECT [Order Details].*, P.ProductName, P.UnitPrice 
FROM [Order Details]
INNER JOIN Products AS P 
ON [Order Details].ProductID = P.ProductID


--list all customers who have never ordered anything before (CustomerID and CompanyName in the Customers table).
--A customer who did not order anything is a customer whose ID is not included in any order in the Orders table.
--Please use LEFT JOIN.
SELECT Customers.CustomerID, Customers.CompanyName 
FROM Customers 
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID 
WHERE Orders.CustomerID IS NULL


-- list the number of the customers (Customers table)
 SELECT Count (*) 
 From Customers

--modify the query above: only the customers from Germany are counted
 SELECT Count (*) 
 From Customers 
 WHERE Country LIKE 'Germany' 


--specify the number of customers per country (Customers table). Sort the data ascending by country name
SELECT Count (*) AS Total, Country 
From Customers 
GROUP BY Country 
ORDER BY Country ASC 

--modify the query above: data is sorted descending by the number of customers and if there are the same number of customers from certain countries
--these records should be sorted ascending by the name of the country
SELECT Count (*) AS Total, Country 
From Customers 
GROUP BY Country 
ORDER BY Total DESC, Country ASC 


--modify the query above: return only countries with more than 5 customers
SELECT Count (*) AS Total, Country 
From Customers 
GROUP BY Country 
HAVING COUNT(*) > 5 
ORDER BY Total DESC, Country ASC

--list the number of customers per each country
SELECT Count (*) AS TotalPerCountry, Country 
From Customers 
GROUP BY Country 


--list the number of customers per each city, having a name starting with C or A (using CompanyName column)
SELECT City, COUNT(CompanyName) AS CompaniesAC
From Customers 
WHERE CompanyName LIKE 'C%' OR CompanyName LIKE 'A%'
GROUP BY City


--using CategoryID, list number of products per each category
--(using COUNT),the lowest unit price within a category, the highest unit price of the product, average unit price 
--and how many units of goods are in total in stock
--(sum the contents of the UnitsInStock column)
SELECT COUNT(CategoryID) AS ProductsPerCategory, MIN(UnitPrice) AS MinPricePerCategory, 
MAX(UnitPrice) AS MaxPricePerCategory, AVG(UnitPrice) AS AvgPricePerCategory, SUM(UnitsInStock) AS TotalUnitsPerCategory
From Products 
GROUP BY CategoryID
