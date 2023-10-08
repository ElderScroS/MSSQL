create table BonusCards
(
	[ID] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	[PIN] nvarchar(50) NOT NULL,
	[CashBack] float
);

create table Customers
(
	[ID] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(80) NOT NULL,
	[Surname] nvarchar(100) NOT NULL,
	[Age] int NOT NULL,
	[BonusCard_ID] int FOREIGN KEY (BonusCard_ID) REFERENCES BonusCards(ID)
);

create table Cars
(
	[ID] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[Model] nvarchar(50) NOT NULL,
	[PublishingDate] date NOT NULL,
	[CashBackPercent] float NULL,
	[Price] money NOT NULL,
);

create table Orders
(
	[ID] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	[Car_ID] int FOREIGN KEY (Car_ID) REFERENCES Cars(ID) NOT NULL,
	[Customer_ID] int FOREIGN KEY (Customer_ID) REFERENCES Customers(ID) NOT NULL,
	[BonusCard_ID] int FOREIGN KEY (BonusCard_ID) REFERENCES BonusCards(ID),
	[DateOrder] date NOT NULL,
	[Price] money NOT NULL
);

SELECT Orders.Price, Orders.DateOrder, 
 (SELECT Model FROM Cars WHERE Orders.Car_ID = Cars.ID),
 (SELECT [Name] FROM Cars WHERE Orders.Car_ID = Cars.ID) FROM Orders

SELECT [Name], Model, PublishingDate,
(SELECT avg(Price) FROM Cars as ResCars WHERE (ResCars.Model = Cars.Model)) as AvgPriceByBrand FROM Cars

SELECT Customers.[Name], Surname FROM Customers WHERE (Customers.ID NOT IN (SELECT Orders.Customer_ID FROM Orders))

SELECT Customers.[Name] FROM Customers WHERE EXISTS (SELECT CashBack FROM BonusCards
 WHERE (Customers.BonusCard_ID = BonusCards.ID and CashBack > 1000))

SELECT * FROM Cars WHERE NOT EXISTS (SELECT Orders.Car_ID FROM Orders WHERE Orders.Car_ID = Cars.ID)

UPDATE Cars SET CashBackPercent = (CashBackPercent * 110) / 100
WHERE NOT EXISTS (SELECT Orders.Car_ID FROM Orders WHERE Orders.Car_ID = Cars.ID)
