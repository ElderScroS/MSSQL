SELECT * 
 FROM Employees

SELECT * FROM Employees
 WHERE (Salary < 250)

SELECT * FROM Employees
 WHERE (Salary > 1000)

UPDATE Employees
 SET Salary = (Salary * 130) / 100
 WHERE (Salary < 250)

UPDATE Employees
 SET Salary = (Salary * 170) / 100
 WHERE (Position = 'Programming')

UPDATE Employees
 SET Fine = Fine + 10
 WHERE (BeingLate > 5)

DELETE Employees
 WHERE (Fine > 150)

SELECT *
 FROM Employees