===============================================<<<SelectQuery>>>==============================================

--1. Вывести содержимое таблицы 
SELECT [Id]
      ,[Name]
      ,[Surname]
      ,[Birthdate]
      ,[Gender]
      ,[Departament]
      ,[Position]
      ,[Salary]
      ,[Bonus]
      ,[StartPositionDate]
      ,[EndPositionDate]
  FROM Summary.dbo.Employee

--2. Вывести фамилии и zarplati всех rabocix.
SELECT [Surname], [Salary]
 FROM Employee

--3. Вывести все familii без повторений.
SELECT DISTINCT Surname
 FROM Employee

--4. Vivesti vse departamenti i pozitii
SELECT [Departament], [Position]
 FROM Employee

--5. Vivesti vse departamenti bez povtoreniy
SELECT DISTINCT Departament
 FROM Employee

--6. Vivesti vse imena s favimiliyami v odnom stolbce i departament s poziciyeye vo vtorom stolbce
SELECT [Name] + ' ' + [Surname] as FullName, [Departament] + ' ' + [Position] as WorkPlace
 FROM Employee

--7. vivesti rebotnikov kotoriye polucili bonus
SELECT [Name]
 FROM Employee WHERE (Bonus > 0)

--8.Vivesti vsex rabotnikov cya zarplata i bonusi v summe previwayut 1500 azn
SELECT [Name], [Salary] + [Bonus] as General
 FROM Employee WHERE (Salary + Bonus > 1500)

--9.Vivesti vsex rabotnikov cya polovina zarplati previwaet bonus bolshe cem v 3 raza
SELECT [Name]
 FROM Employee WHERE ((Salary / 2) / Bonus > 3)


==================================================<<<TableQuery>>>===============================================

CREATE TABLE Employee
(
	[Id] int IDENTITY(1, 1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL,
	[Surname] nvarchar(50) NOT NULL,
	[Birthdate] date NOT NULL,
	[Gender] bit NOT NULL,
	[Salary] money DEFAULT 0 NOT NULL,
	[Bonus] money DEFAULT 0,
	[Position] nvarchar(50) NOT NULL,
	[Department] nvarchar(50) NOT NULL,
	[StartPositionDate] date NOT NULL,
	[EndPositionDate] date NOT NULL,

	CHECK((Salary >= 0 AND Bonus >= 0) AND (EndPositionDate >= StartPositionDate))
)


================================================<<<EditTable>>>===================================================

1	Mark	Nikulov	1995-10-10	False	20000.0000	2000.0000	Assembler	ATWA	2020-01-01	2025-01-01
2	Egor 	Kulichev	1990-12-02	False	4000.0000	1000.0000	Python	B.Y.O.B	2022-01-01	2030-01-01
3	Alina	Akhedova	1993-02-02	True	12000.0000	1500.0000	C#	Aerials	2021-01-01	2024-01-01
4	Huseyn	Aliyev	1990-05-16	False	16000.0000	1200.0000	C++	Suggests	2022-01-01	2027-01-01
5	Ayten	AY-10	1999-08-08	True	34000.0000	2500.0000	Assembler	InnerVis	2024-01-01	2035-01-01
NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL


/// Вы скопируйте и вставьте в edit table