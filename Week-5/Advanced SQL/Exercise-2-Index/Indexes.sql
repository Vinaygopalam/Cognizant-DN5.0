--------------------------------------------------
-- Exercise 1: Non-Clustered Index
--------------------------------------------------

-- Query Before Index Creation
SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO

-- Create Non-Clustered Index
CREATE NONCLUSTERED INDEX IX_Products_ProductName
ON Products(ProductName);
GO

-- Query After Index Creation
SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO

--------------------------------------------------
-- Exercise 2: Clustered Index
--------------------------------------------------

-- Query Before Index Creation
SELECT *
FROM Orders
WHERE OrderDate = '2023-01-15';
GO

-- Create Clustered Index
CREATE CLUSTERED INDEX IX_Orders_OrderDate
ON Orders(OrderDate);
GO

-- Query After Index Creation
SELECT *
FROM Orders
WHERE OrderDate = '2023-01-15';
GO

--------------------------------------------------
-- Exercise 3: Composite Index
--------------------------------------------------

-- Query Before Index Creation
SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2023-01-15';
GO

-- Create Composite Index
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID_OrderDate
ON Orders(CustomerID, OrderDate);
GO

-- Query After Index Creation
SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2023-01-15';
GO

--------------------------------------------------
-- Notes
--------------------------------------------------

-- Non-Clustered Index:
-- Improves searching on a specific column.

-- Clustered Index:
-- Sorts and stores the table physically based on the indexed column.

-- Composite Index:
-- Index created on multiple columns to improve multi-column searches.