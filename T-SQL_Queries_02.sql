-- T-SQL queries by @Anna-Portfolio --https://github.com/anna-portfolio
-- CREATE TABLE, ALTER TABLE, INSERT INTO, UPDATE, SET, DELETE

--CREATE NEW TABLE "ProductExport" INTO THE DATABASE
--Create table "ProductsExport" including columns: ProductID (integer, primary key), ProductName (string limited to 30 characters), UnitPrice (decimal), Stock (integer)
CREATE TABLE ProductsExport (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(30),
UnitPrice DECIMAL(5,3),
Stock INT
)

select * from ProductsExport
--ALTER TABLE
-- Alter table "ProductsExport" by adding a constraint: the UnitPrice needs to be higher than zero
ALTER TABLE ProductsExport
ADD CONSTRAINT c1 CHECK (UnitPrice > 0)

-- Add field "Description" (string max 250 chars) to the "ProductsExport" table
ALTER TABLE ProductsExport
ADD Description VARCHAR(250)

-- Change the column type for "UnitPrice" in the "ProductsExport" table from decimal to float
ALTER TABLE ProductsExport
ALTER COLUMN UnitPrice FLOAT

-- Add the NOT NULL constraint to the "ProductsExport" table, column "Stock"
ALTER TABLE ProductsExport
ALTER COLUMN Stock INT NOT NULL


--INSERT INTO TABLE
--Insert five products into the ProductsExport table
INSERT INTO ProductsExport VALUES
(001, 'Laptop', 3500, 1000, 'Lorem ipsum'),
(002, 'Smartphone', 2800, 2000, NULL),
(003, 'Tablet', 2600, 700, 'Lorem ipsum'),
(004, 'Headphones', 300, 5000, NULL),
(005, 'Camera', 1500, 2500, 'Lorem ipsum')

--UPDATE
-- Update product name to "Smartwatch" into the ProductsExport table, where ProductID is 003
UPDATE ProductsExport
SET ProductName = 'Smartwatch'
WHERE ProductID = 003

--In the ProductsExport table, for the product with ProductID 001, update the stock value to 1500
UPDATE ProductsExport
SET Stock = 1500
WHERE ProductID = 001

-- For the products in the ProductsExport table which stock value is less than 70, update the unit price by 10%
UPDATE ProductsExport
SET UnitPrice = UnitPrice * 1.1
WHERE Stock < 70


--DELETE
-- In the ProductsExport table, remove all the products which unit price is less than 1000
DELETE FROM ProductsExport WHERE UnitPrice < 1000

-- In the ProductsExport table, remove all the products whose name starts with 'a'
DELETE FROM ProductsExport WHERE ProductName LIKE 'a%' 

--In the ProductsExport table, remove all the products whose stock value equals to zero
DELETE FROM ProductsExport WHERE Stock = 0