--------------------------------------------------
-- Exercise 1: Create a Cursor
--------------------------------------------------

DECLARE @EmployeeID INT;
DECLARE @FirstName VARCHAR(50);
DECLARE @LastName VARCHAR(50);
DECLARE @DepartmentID INT;
DECLARE @Salary DECIMAL(10,2);

DECLARE EmployeeCursor CURSOR
FOR
SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary
FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor
INTO @EmployeeID, @FirstName, @LastName, @DepartmentID, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'EmployeeID: ' + CAST(@EmployeeID AS VARCHAR(10))
        + ', Name: ' + @FirstName + ' ' + @LastName
        + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR(10))
        + ', Salary: ' + CAST(@Salary AS VARCHAR(20));

    FETCH NEXT FROM EmployeeCursor
    INTO @EmployeeID, @FirstName, @LastName, @DepartmentID, @Salary;
END

CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;
GO

--------------------------------------------------
-- Exercise 2: Static Cursor
--------------------------------------------------

DECLARE StaticCursor CURSOR STATIC
FOR
SELECT *
FROM Employees;

OPEN StaticCursor;

CLOSE StaticCursor;
DEALLOCATE StaticCursor;
GO

--------------------------------------------------
-- Exercise 2: Dynamic Cursor
--------------------------------------------------

DECLARE DynamicCursor CURSOR DYNAMIC
FOR
SELECT *
FROM Employees;

OPEN DynamicCursor;

CLOSE DynamicCursor;
DEALLOCATE DynamicCursor;
GO

--------------------------------------------------
-- Exercise 2: Forward-Only Cursor
--------------------------------------------------

DECLARE ForwardCursor CURSOR FORWARD_ONLY
FOR
SELECT *
FROM Employees;

OPEN ForwardCursor;

CLOSE ForwardCursor;
DEALLOCATE ForwardCursor;
GO

--------------------------------------------------
-- Exercise 2: Keyset Cursor
--------------------------------------------------

DECLARE KeysetCursor CURSOR KEYSET
FOR
SELECT *
FROM Employees;

OPEN KeysetCursor;

CLOSE KeysetCursor;
DEALLOCATE KeysetCursor;
GO

--------------------------------------------------
-- Notes
--------------------------------------------------

-- STATIC Cursor
-- Creates a snapshot of the data.
-- Changes made after opening are not visible.

-- DYNAMIC Cursor
-- Reflects all INSERT, UPDATE and DELETE operations.

-- FORWARD_ONLY Cursor
-- Can move only in the forward direction.
-- Fastest cursor type.

-- KEYSET Cursor
-- Stores only keys.
-- Updates are visible, but newly inserted rows are not.