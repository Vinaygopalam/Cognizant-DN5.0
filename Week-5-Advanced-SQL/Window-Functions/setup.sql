CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(18, 2)
);

INSERT INTO Employees VALUES (1, 'Alice', 'HR', 5000);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 7000);
INSERT INTO Employees VALUES (3, 'Charlie', 'IT', 8000);
INSERT INTO Employees VALUES (4, 'David', 'HR', 4500);
INSERT INTO Employees VALUES (5, 'Eva', 'Sales', 6000);
INSERT INTO Employees VALUES (6, 'Frank', 'Sales', 6500);

SELECT 
    Id, Name, Department, Salary,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) as RowNum,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) as RankVal,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) as DenseRankVal
FROM Employees;
