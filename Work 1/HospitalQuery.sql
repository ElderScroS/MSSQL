CREATE TABLE Departaments
(
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	_Name NVARCHAR(100) NOT NULL UNIQUE,
	Building INT NOT NULL,
	Financing MONEY DEFAULT 0 NOT NULL,

	CHECK((Financing > 0) AND (Building >= 0 AND Building <= 5) AND (_Name != ''))
)

CREATE TABLE Diseases
(
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	_Name NVARCHAR(100) NOT NULL UNIQUE,
	Severity INT DEFAULT 1 NOT NULL,

	CHECK((_Name != '') AND (Severity > 1))
)

CREATE TABLE Doctors
(
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	_Name NVARCHAR(MAX) NOT NULL,
	Surname NVARCHAR(MAX) NOT NULL,
	Phone CHAR(10) NULL,
	Salary MONEY  NOT NULL,

	CHECK((_Name != '') AND (Surname != '') AND (Salary > 0))
)

CREATE TABLE Examinations
(
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	_Name NVARCHAR(100) UNIQUE NOT NULL,
	_DayOfWeek INT NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL,

	CHECK((_Name != '') AND (_DayOfWeek >= 1 AND _DayOfWeek <= 7) AND (EndTime > StartTime) AND (StartTime > '08:00' AND StartTime < '18:00'))
)