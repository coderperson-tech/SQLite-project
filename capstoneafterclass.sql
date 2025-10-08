CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'Harsh', 'Patel', 'Finance', 75000.00, '2020-03-15'),
(2, 'Aisha', 'Khan', 'HR', 62000.00, '2019-07-22'),
(3, 'Ravi', 'Verma', 'IT', 88000.00, '2021-01-10'),
(4, 'Sara', 'Lee', 'Marketing', 67000.00, '2018-11-05'),
(5, 'John', 'Smith', 'IT', 91000.00, '2022-06-30');


SELECT * FROM Employees
WHERE Salary > 70000
ORDER BY Salary DESC;


SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;



SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > '2021-01-01'
ORDER BY HireDate ASC;
