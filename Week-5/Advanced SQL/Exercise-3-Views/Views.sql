USE CognizantDB;
GO

--------------------------------------------------
-- CREATE TABLES
--------------------------------------------------

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

--------------------------------------------------
-- INSERT SAMPLE DATA
--------------------------------------------------

INSERT INTO Departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

INSERT INTO Employees VALUES
(101,'Vinay','Gopalam',50000,1),
(102,'Rahul','Sharma',45000,2),
(103,'Sneha','Reddy',60000,3);

--------------------------------------------------
-- Exercise 1
-- Create Simple View
--------------------------------------------------

CREATE VIEW vw_EmployeeBasicInfo
AS
SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeBasicInfo;

--------------------------------------------------
-- Exercise 2
-- Employee Full Name View
--------------------------------------------------

CREATE VIEW vw_EmployeeFullName
AS
SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS FullName
FROM Employees;

SELECT * FROM vw_EmployeeFullName;

--------------------------------------------------
-- Exercise 3
-- Employee Annual Salary View
--------------------------------------------------

CREATE VIEW vw_EmployeeAnnualSalary
AS
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    Salary * 12 AS AnnualSalary
FROM Employees;

SELECT * FROM vw_EmployeeAnnualSalary;

--------------------------------------------------
-- Exercise 4
-- Employee Report View
--------------------------------------------------

CREATE VIEW vw_EmployeeReport
AS
SELECT
    E.EmployeeID,
    E.FirstName + ' ' + E.LastName AS FullName,
    D.DepartmentName,
    Salary * 12 AS AnnualSalary,
    (Salary * 12) * 0.10 AS Bonus
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID;

SELECT * FROM vw_EmployeeReport;