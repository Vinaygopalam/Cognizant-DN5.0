USE CognizantDB;
GO

--------------------------------------------------
-- Create AuditLog table (used in all exercises)
--------------------------------------------------

IF OBJECT_ID('AuditLog', 'U') IS NULL
BEGIN
    CREATE TABLE AuditLog
    (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        ErrorMessage NVARCHAR(MAX),
        ErrorDate DATETIME DEFAULT GETDATE()
    );
END;
GO

--------------------------------------------------
-- Question 1: Basic TRY...CATCH for Error Logging
--------------------------------------------------

CREATE OR ALTER PROCEDURE AddEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (ErrorMessage)
        VALUES (ERROR_MESSAGE());
    END CATCH
END;
GO

--------------------------------------------------
-- Question 2: TRY...CATCH with THROW
--------------------------------------------------

CREATE OR ALTER PROCEDURE AddEmployee_WithThrow
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (ErrorMessage)
        VALUES (ERROR_MESSAGE());

        THROW;
    END CATCH
END;
GO

--------------------------------------------------
-- Question 3: Custom Error with RAISERROR
--------------------------------------------------

CREATE OR ALTER PROCEDURE AddEmployee_ValidateSalary
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    IF @Salary <= 0
    BEGIN
        RAISERROR ('Salary must be greater than zero.', 16, 1);
        RETURN;
    END

    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (ErrorMessage)
        VALUES (ERROR_MESSAGE());
    END CATCH
END;
GO

--------------------------------------------------
-- Question 4: Nested TRY...CATCH with RAISERROR
--------------------------------------------------

CREATE OR ALTER PROCEDURE TransferEmployee
    @EmployeeID INT,
    @NewDepartmentID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRY
            IF NOT EXISTS
            (
                SELECT 1
                FROM Departments
                WHERE DepartmentID = @NewDepartmentID
            )
            BEGIN
                RAISERROR ('Department does not exist.', 16, 1);
            END

            UPDATE Employees
            SET DepartmentID = @NewDepartmentID
            WHERE EmployeeID = @EmployeeID;
        END TRY
        BEGIN CATCH
            INSERT INTO AuditLog (ErrorMessage)
            VALUES (ERROR_MESSAGE());

            THROW;
        END CATCH
    END TRY
    BEGIN CATCH
        PRINT 'Outer CATCH block executed';
        THROW;
    END CATCH
END;
GO

--------------------------------------------------
-- Question 5: Transactions with TRY...CATCH
--------------------------------------------------

CREATE OR ALTER PROCEDURE BatchInsertEmployees
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

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
        (105, 'Arjun', 'Reddy', 1, 50000, '2026-07-23');

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
        (106, 'Meena', 'Kumar', 2, 45000, '2026-07-23');

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        INSERT INTO AuditLog (ErrorMessage)
        VALUES (ERROR_MESSAGE());
    END CATCH
END;
GO

--------------------------------------------------
-- Question 6: Dynamic RAISERROR with Severity and State
--------------------------------------------------

CREATE OR ALTER PROCEDURE AddEmployee_Severity
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    IF @Salary < 0
    BEGIN
        RAISERROR ('Salary cannot be negative.', 16, 1);
        RETURN;
    END

    IF @Salary < 1000
    BEGIN
        RAISERROR ('Salary is too low.', 10, 1);
    END

    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (ErrorMessage)
        VALUES (ERROR_MESSAGE());

        THROW;
    END CATCH
END;
GO

--------------------------------------------------
-- Sample Execution Queries
--------------------------------------------------

EXEC AddEmployee
    @EmployeeID = 107,
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @DepartmentID = 1,
    @Salary = 50000,
    @JoinDate = '2026-07-23';
GO

EXEC AddEmployee_WithThrow
    @EmployeeID = 107,
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @DepartmentID = 1,
    @Salary = 50000,
    @JoinDate = '2026-07-23';
GO

EXEC AddEmployee_ValidateSalary
    @EmployeeID = 108,
    @FirstName = 'Test',
    @LastName = 'User',
    @DepartmentID = 1,
    @Salary = -100,
    @JoinDate = '2026-07-23';
GO

EXEC TransferEmployee
    @EmployeeID = 101,
    @NewDepartmentID = 99;
GO

EXEC BatchInsertEmployees;
GO

EXEC AddEmployee_Severity
    @EmployeeID = 109,
    @FirstName = 'Low',
    @LastName = 'Salary',
    @DepartmentID = 1,
    @Salary = 500,
    @JoinDate = '2026-07-23';
GO

SELECT * FROM AuditLog;
GO