--------------------------------------------------
-- Exercise 1: Create Scalar Function
--------------------------------------------------

CREATE FUNCTION fn_CalculateAnnualSalary
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
GO

--------------------------------------------------
-- Test Exercise 1
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

--------------------------------------------------
-- Exercise 2: Create Table-Valued Function
--------------------------------------------------

CREATE FUNCTION fn_GetEmployeesByDepartment
(
    @DepartmentID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary
    FROM Employees
    WHERE DepartmentID = @DepartmentID
);
GO

--------------------------------------------------
-- Test Exercise 2
--------------------------------------------------

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(1);
GO

--------------------------------------------------
-- Exercise 3: Create User Defined Function
--------------------------------------------------

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.10;
END;
GO

--------------------------------------------------
-- Test Exercise 3
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO

--------------------------------------------------
-- Exercise 4: Modify User Defined Function
--------------------------------------------------

ALTER FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO
--------------------------------------------------
-- Exercise 5: Delete User Defined Function
--------------------------------------------------

DROP FUNCTION IF EXISTS fn_CalculateBonus;
GO

--------------------------------------------------
-- Exercise 6: Execute Scalar Function
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

--------------------------------------------------
-- Exercise 7: Return Annual Salary for Specific Employee
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 1;
GO

--------------------------------------------------
-- Exercise 8: Return Data from Table-Valued Function
--------------------------------------------------

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(3);
GO

--------------------------------------------------
-- Exercise 9: Create Nested User Defined Function
--------------------------------------------------

CREATE FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
           + dbo.fn_CalculateBonus(@Salary);
END;
GO

--------------------------------------------------
-- Test Exercise 9
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO

--------------------------------------------------
-- Exercise 10: Modify Nested User Defined Function
--------------------------------------------------

ALTER FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
           + (@Salary * 0.15);
END;
GO

--------------------------------------------------
-- Test Exercise 10
--------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO