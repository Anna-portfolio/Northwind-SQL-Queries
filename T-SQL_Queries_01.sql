-- T-SQL queries by @Anna-Portfolio --https://github.com/anna-portfolio
-- SELECT, WHERE, LIKE, ORDER BY, ASC, DESC, comparison operators, logical operators, dates

-- Sort the customers alphabetically by name
SELECT * FROM [Northwind].[dbo].[Customers] ORDER BY CompanyName 

-- List customers whose name does not contain the letter "e"
SELECT * FROM [Northwind].[dbo].[Customers] WHERE CompanyName NOT LIKE '%e%' 

-- List customers whose country name has "UK" OR "USA"
SELECT * FROM [Northwind].[dbo].[Customers] WHERE Country LIKE '%UK%' OR Country LIKE '%USA%'

-- List customers who are not located in the countries "USA", "UK" or "Mexico".
SELECT * FROM [Northwind].[dbo].[Customers] WHERE Country NOT IN ('USA', 'UK', 'Mexico')

-- List customers from Spain or France whose names do not start with "F"
SELECT * FROM [Northwind].[dbo].[Customers] WHERE Country IN ('Spain', 'France') AND CompanyName NOT LIKE 'f%'

-- List customers whose names end in "S.A."
SELECT * FROM [Northwind].[dbo].[Customers] WHERE CompanyName LIKE '%S.A.' 

-- Sort employees ascending by hire date
SELECT * FROM [Northwind].[dbo].[Employees] ORDER BY HireDate

--List employees whose last names contain the letters "an"
-- no results meeting such criteria in the database
SELECT * FROM [Northwind].[dbo].[Employees] WHERE LastName LIKE '%an%'

-- List employees hired after 1993 and sort them alphabetically by surname
SELECT * FROM [Northwind].[dbo].[Employees] WHERE YEAR(HireDate) > '1993' ORDER BY LastName

-- List the employees who live in the US and sort them by date of birth, from oldest to youngest
SELECT * FROM [Northwind].[dbo].[Employees] WHERE Country = 'USA' ORDER BY BirthDate 

-- List employees whose zip code starts with "95" or ends with "01"
SELECT * FROM [Northwind].[dbo].[Customers] WHERE PostalCode LIKE '95%' OR PostalCode LIKE '%01'

--List orders placed before 1997
SELECT * FROM [Northwind].[dbo].[Orders] WHERE YEAR(OrderDate) < 1997

-- List orders placed in October 1996
SELECT * FROM [Northwind].[dbo].[Orders] WHERE MONTH(OrderDate) = 10 AND YEAR(OrderDate) = 1996

-- Sort orders ascending by order date
SELECT * FROM [Northwind].[dbo].[Orders] ORDER BY OrderDate 

-- List orders placed before 1997 and sort them ascending by date
SELECT * FROM [Northwind].[dbo].[Orders] WHERE YEAR(OrderDate) < '1997' ORDER BY OrderDate

--List orders whose ID is between 10300 and 10400 and sort them descending by value
SELECT * FROM [Northwind].[dbo].[Orders] WHERE OrderID BETWEEN 10300 AND 10400 ORDER BY OrderID DESC

-- List orders whose weight is either above 300 or placed by customer ID 2
-- no results meeting such criteria in the database
SELECT * FROM [Northwind].[dbo].[Orders] WHERE Freight > 300 OR CustomerID = '2'

-- List the orders that were delivered to a customer with an ID starting with the letter Q and sort them descending by delivery date
SELECT * FROM [Northwind].[dbo].[Orders] WHERE CustomerID LIKE 'q%' ORDER BY ShippedDate DESC

-- List orders whose ID is odd
SELECT * FROM [Northwind].[dbo].[Orders] WHERE (OrderID % 2) != 0

-- Sort products descending by unit price
SELECT * FROM [Northwind].[dbo].[Products] ORDER BY UnitPrice DESC

--List the products whose unit price is less than than 60
SELECT * FROM [Northwind].[dbo].[Products] WHERE UnitPrice < 60

--List the products whose unit price is between 40 and 50
SELECT * FROM [Northwind].[dbo].[Products] WHERE UnitPrice BETWEEN 40 AND 50

-- List the products whose unit price is either 20, 30 or 40
SELECT * FROM [Northwind].[dbo].[Products] WHERE UnitPrice = 20 OR UnitPrice = 30 OR UnitPrice = 40

-- List the products whose unit price is above 100 and sort them descending by unit price
SELECT * FROM [Northwind].[dbo].[Products] WHERE UnitPrice > 100 ORDER BY UnitPrice DESC

--List the products whose name starts with the letter "B" OR "T"
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE 'B%' OR ProductName LIKE 'T%' 
ORDER BY Productname ASC

-- List products whose names contain at least one space
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE '% %'

-- List the products whose name contains the word "suklaa"
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE '%suklaa%' 

-- List products whose names end in "w" or "a"
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE '%w' OR ProductName LIKE '%a'

-- List the products whose name starts with the letter "c" and sort them descending by unit price
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE 'c%' ORDER BY UnitPrice DESC

-- List products whose names end in "o" and sort them alphabetically by name
SELECT * FROM [Northwind].[dbo].[Products] WHERE ProductName LIKE '%o' ORDER BY ProductName