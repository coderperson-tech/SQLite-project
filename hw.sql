
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Fraudulent BIT 
);


INSERT INTO Employees (EmpID, Name, Department, Salary, Fraudulent) VALUES
(1, 'Alice', 'HR', 4500, 0),
(2, 'Bob', 'Finance', 5500, 1),
(3, 'Charlie', 'IT', 6000, 0),
(4, 'David', 'Finance', 7000, 1),
(5, 'Eva', 'Marketing', 5000, 0);


SELECT * FROM Employees;


SELECT * 
FROM Employees
WHERE Fraudulent = 1;


SELECT Name, Salary
FROM Employees
WHERE Department = 'Finance';
