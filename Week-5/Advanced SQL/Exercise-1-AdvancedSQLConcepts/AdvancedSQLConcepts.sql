--------------------------------------------------
-- Exercise 1: Ranking and Window Functions
--------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Price DESC) AS RowNum,
    RANK() OVER(PARTITION BY Category ORDER BY Price DESC) AS RankNum,
    DENSE_RANK() OVER(PARTITION BY Category ORDER BY Price DESC) AS DenseRankNum
FROM Products;
GO

--------------------------------------------------
-- Top 3 Products Per Category
--------------------------------------------------

WITH ProductRanking AS
(
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RowNum
    FROM Products
)

SELECT *
FROM ProductRanking
WHERE RowNum <= 3;
GO

--------------------------------------------------
-- Exercise 2: GROUPING SETS
--------------------------------------------------

SELECT
    C.Region,
    P.Category,
    SUM(OD.Quantity) AS TotalQuantity
FROM Orders O
JOIN OrderDetails OD
ON O.OrderID = OD.OrderID
JOIN Customers C
ON O.CustomerID = C.CustomerID
JOIN Products P
ON OD.ProductID = P.ProductID
GROUP BY GROUPING SETS
(
    (C.Region, P.Category),
    (C.Region),
    (P.Category),
    ()
);
GO

--------------------------------------------------
-- Exercise 2: ROLLUP
--------------------------------------------------

SELECT
    C.Region,
    P.Category,
    SUM(OD.Quantity) AS TotalQuantity
FROM Orders O
JOIN OrderDetails OD
ON O.OrderID = OD.OrderID
JOIN Customers C
ON O.CustomerID = C.CustomerID
JOIN Products P
ON OD.ProductID = P.ProductID
GROUP BY ROLLUP(C.Region, P.Category);
GO

--------------------------------------------------
-- Exercise 2: CUBE
--------------------------------------------------

SELECT
    C.Region,
    P.Category,
    SUM(OD.Quantity) AS TotalQuantity
FROM Orders O
JOIN OrderDetails OD
ON O.OrderID = OD.OrderID
JOIN Customers C
ON O.CustomerID = C.CustomerID
JOIN Products P
ON OD.ProductID = P.ProductID
GROUP BY CUBE(C.Region, P.Category);
GO

--------------------------------------------------
-- Exercise 3: Recursive CTE
--------------------------------------------------

WITH CalendarCTE AS
(
    SELECT CAST('2025-01-01' AS DATE) AS CalendarDate

    UNION ALL

    SELECT DATEADD(DAY,1,CalendarDate)
    FROM CalendarCTE
    WHERE CalendarDate < '2025-01-31'
)

SELECT *
FROM CalendarCTE
OPTION(MAXRECURSION 31);
GO

--------------------------------------------------
-- Exercise 3: MERGE
--------------------------------------------------

MERGE Products AS Target
USING StagingProducts AS Source
ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN
UPDATE SET
Target.Price = Source.Price

WHEN NOT MATCHED THEN
INSERT
(
ProductID,
ProductName,
Category,
Price
)
VALUES
(
Source.ProductID,
Source.ProductName,
Source.Category,
Source.Price
);
GO

--------------------------------------------------
-- Exercise 4: PIVOT
--------------------------------------------------

SELECT *
FROM
(
SELECT
ProductID,
MONTH(OrderDate) AS SalesMonth,
Quantity
FROM Orders O
JOIN OrderDetails OD
ON O.OrderID=OD.OrderID
) AS SourceTable

PIVOT
(
SUM(Quantity)
FOR SalesMonth
IN
(
[1],[2],[3],[4],[5],[6],
[7],[8],[9],[10],[11],[12]
)
) AS PivotTable;
GO

--------------------------------------------------
-- Exercise 4: UNPIVOT
--------------------------------------------------

SELECT
ProductID,
SalesMonth,
Quantity
FROM PivotTable

UNPIVOT
(
Quantity
FOR SalesMonth
IN
(
[1],[2],[3],[4],[5],[6],
[7],[8],[9],[10],[11],[12]
)
) AS UnPivotTable;
GO

--------------------------------------------------
-- Exercise 5: CTE
--------------------------------------------------

WITH CustomerOrderCounts AS
(
SELECT
CustomerID,
COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
)

SELECT
C.CustomerID,
C.Name,
COC.OrderCount
FROM CustomerOrderCounts COC
JOIN Customers C
ON C.CustomerID=COC.CustomerID

WHERE COC.OrderCount>3;
GO