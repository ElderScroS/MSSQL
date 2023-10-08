CREATE TABLE Employees
(
	[ID] int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Surname] nvarchar(50) NOT NULL,
	[FatherName] nvarchar(50) NULL,
	[BirthDate] date NOT NULL,
	[Position] nvarchar(100) NOT NULL,
	[Salary] money DEFAULT 0 NOT NULL,
	[BeingLate] int DEFAULT 0 NULL,
	[Fine] money DEFAULT 0 NULL
)