WITH DeptSalaries AS (
    SELECT Department, AVG(Salary) as AvgSalary
    FROM Employees
    GROUP BY Department
)
SELECT * FROM DeptSalaries WHERE AvgSalary > 5000;
