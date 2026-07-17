CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    Name VARCHAR(100),
    Stock INT
);

INSERT INTO Products VALUES (1, 'Laptop', 10);
INSERT INTO Products VALUES (2, 'Mouse', 50);

CREATE PROCEDURE GetProductStock
    @ProdId INT,
    @StockOut INT OUTPUT
AS
BEGIN
    SELECT @StockOut = Stock FROM Products WHERE ProductId = @ProdId;
END;
