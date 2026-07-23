--------------------------------------------------
-- Exercise 1: Create Stored Procedure
--------------------------------------------------

CREATE PROCEDURE sp_InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @DepartmentID,
        @Salary,
        @JoinDate
    );
END;
GO

--------------------------------------------------
-- Exercise 2: Modify Stored Procedure
--------------------------------------------------

ALTER PROCEDURE sp_InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @DepartmentID,
        @Salary,
        @JoinDate
    );

    SELECT EmployeeID,
           FirstName,
           LastName,
           Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
END;
GO

--------------------------------------------------
-- Exercise 3: Delete Stored Procedure
--------------------------------------------------

DROP PROCEDURE IF EXISTS sp_InsertEmployee;
GO

--------------------------------------------------
-- Exercise 4: Execute Stored Procedure
--------------------------------------------------

EXEC sp_InsertEmployee
    @EmployeeID = 104,
    @FirstName = 'Anil',
    @LastName = 'Kumar',
    @DepartmentID = 1,
    @Salary = 65000,
    @JoinDate = '2026-07-23';
GO
--------------------------------------------------
-- Exercise 5: Return Employee Count by Department
--------------------------------------------------

CREATE PROCEDURE sp_GetEmployeeCount
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

--------------------------------------------------
-- Exercise 6: Output Parameter - Total Salary
--------------------------------------------------

CREATE PROCEDURE sp_GetTotalSalary
    @DepartmentID INT,
    @TotalSalary DECIMAL(18,2) OUTPUT
AS
BEGIN
    SELECT @TotalSalary = SUM(Salary)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

--------------------------------------------------
-- Exercise 7: Update Employee Salary
--------------------------------------------------

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = @NewSalary
    WHERE EmployeeID = @EmployeeID;
END;
GO

--------------------------------------------------
-- Execute Exercise 7
--------------------------------------------------

EXEC sp_UpdateEmployeeSalary
    @EmployeeID = 104,
    @NewSalary = 65000;
GO

--------------------------------------------------
-- Exercise 8: Give Bonus to Employees
--------------------------------------------------

CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @BonusAmount DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + @BonusAmount
    WHERE DepartmentID = @DepartmentID;
END;
GO

--------------------------------------------------
-- Execute Exercise 8
--------------------------------------------------

EXEC sp_GiveBonus
    @DepartmentID = 1,
    @BonusAmount = 500;
GO

--------------------------------------------------
-- Exercise 9: Transaction in Stored Procedure
--------------------------------------------------

CREATE PROCEDURE sp_UpdateSalaryTransaction
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Employees
        SET Salary = @NewSalary
        WHERE EmployeeID = @EmployeeID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Transaction Failed!';
    END CATCH
END;
GO

--------------------------------------------------
-- Exercise 10: Dynamic SQL
--------------------------------------------------

CREATE PROCEDURE sp_GetEmployeesDynamic
    @ColumnName VARCHAR(50),
    @Value VARCHAR(100)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    'SELECT * FROM Employees WHERE ' +
    QUOTENAME(@ColumnName) +
    ' = @Value';

    EXEC sp_executesql
        @SQL,
        N'@Value VARCHAR(100)',
        @Value;
END;
GO

--------------------------------------------------
-- Exercise 11: Error Handling using TRY...CATCH
--------------------------------------------------

CREATE PROCEDURE sp_UpdateEmployeeSalary_ErrorHandling
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY

        UPDATE Employees
        SET Salary = @NewSalary
        WHERE EmployeeID = @EmployeeID;

        PRINT 'Salary Updated Successfully';

    END TRY

    BEGIN CATCH

        PRINT 'Error Occurred!';
        PRINT ERROR_MESSAGE();

    END CATCH
END;
GO

--------------------------------------------------
-- Execute Exercise 11
--------------------------------------------------

EXEC sp_UpdateEmployeeSalary_ErrorHandling
    @EmployeeID = 104,
    @NewSalary = 70000;
GO