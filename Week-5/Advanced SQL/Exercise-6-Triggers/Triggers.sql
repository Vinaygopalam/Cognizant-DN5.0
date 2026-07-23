--------------------------------------------------
-- Exercise 1: AFTER Trigger
--------------------------------------------------

CREATE TABLE EmployeeChanges
(
    ChangeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary
    )
    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID
    WHERE d.Salary <> i.Salary;
END;
GO

UPDATE Employees
SET Salary = Salary + 1000
WHERE EmployeeID = 101;
GO

SELECT * FROM EmployeeChanges;
GO

--------------------------------------------------
-- Exercise 2: INSTEAD OF DELETE Trigger
--------------------------------------------------

CREATE TRIGGER trg_PreventEmployeeDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR ('Employee records cannot be deleted!',16,1);
END;
GO

DELETE FROM Employees
WHERE EmployeeID = 101;
GO

--------------------------------------------------
-- Exercise 3: LOGON Trigger
--------------------------------------------------

CREATE TRIGGER trg_LogonRestriction
ON ALL SERVER
FOR LOGON
AS
BEGIN
    IF DATEPART(HOUR, GETDATE()) BETWEEN 2 AND 3
    BEGIN
        ROLLBACK;
        PRINT 'Login is restricted during maintenance hours.';
    END
END;
GO

--------------------------------------------------
-- Exercise 4: Modify Trigger
--------------------------------------------------

ALTER TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN
    PRINT 'Employee salary updated successfully';

    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary
    )
    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID;
END;
GO

--------------------------------------------------
-- Exercise 5: Delete Trigger
--------------------------------------------------

DROP TRIGGER trg_PreventEmployeeDelete;
GO

--------------------------------------------------
-- Exercise 6: Annual Salary Trigger
--------------------------------------------------

ALTER TABLE Employees
ADD AnnualSalary DECIMAL(10,2);
GO

CREATE TRIGGER trg_UpdateAnnualSalary
ON Employees
AFTER UPDATE
AS
BEGIN
    UPDATE E
    SET AnnualSalary = I.Salary * 12
    FROM Employees E
    INNER JOIN inserted I
        ON E.EmployeeID = I.EmployeeID;
END;
GO

UPDATE Employees
SET Salary = Salary + 500
WHERE EmployeeID = 102;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    AnnualSalary
FROM Employees;
GO