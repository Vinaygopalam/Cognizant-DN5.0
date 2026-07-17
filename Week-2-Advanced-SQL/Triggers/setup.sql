CREATE TABLE AuditLogs (
    LogId INT IDENTITY(1,1) PRIMARY KEY,
    Message VARCHAR(255),
    ActionTime DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_AfterProductInsert
ON Products
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLogs(Message)
    SELECT 'New product added: ' + Name FROM inserted;
END;
