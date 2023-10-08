CREATE TABLE Customers
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [Name] nvarchar(50) NOT NULL,
   [Surname] nvarchar(50) NOT NULL,
   [Birthdate] date
);
CREATE TABLE Orders
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [CustomersID] int FOREIGN KEY (CustomersID) REFERENCES Customers(ID) NOT NULL
);

CREATE TABLE BonusCards
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [CardNumber] nvarchar(100) NOT NULL,
   [ExpiryDate] date NOT NULL,
   [Bonus] int,
   [CustomerID] int FOREIGN KEY(CustomerID) REFERENCES Customers(ID) NOT NULL
);
CREATE TABLE OrderDetails
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [Amount] int NOT NULL,
   [OrderID] int FOREIGN KEY(OrderID) REFERENCES Orders(ID) NOT NULL,
   [CustomersID] int FOREIGN KEY (CustomersID) REFERENCES Customers(ID) NOT NULL,
   [CardID] int FOREIGN KEY (CardID) REFERENCES BonusCards(ID) NOT NULL
);
CREATE TABLE Products
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [Name] nvarchar(50) NOT NULL,
   [Description] nvarchar(150) NOT NULL,
   [Price] money NOT NULL
);
(
   [ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
   [OrderID] int FOREIGN KEY (OrderID) REFERENCES OrderDetails(ID) NOT NULL,
   [ProductID] int FOREIGN KEY (ProductID) REFERENCES Products(ID) NOT NULL
);

SELECT [Name], [Surname], [BonusCards].CardNumber FROM Customers
JOIN [BonusCards] on BonusCards.CustomerID = Customers.ID

SELECT [Name], [Surname], [BonusCards].CardNumber, [BonusCards].Bonus FROM Customers
JOIN [BonusCards] on BonusCards.CustomerID = Customers.ID and BonusCards.Bonus > 100

SELECT Customers.[Name], [Surname], [Products].[Name] FROM Customers
JOIN [Orders] on [Orders].CustomersID = Customers.ID
JOIN [OrderDetails] on [OrderDetails].OrderID = Orders.ID and OrderDetails.CustomersID = Customers.ID
JOIN [Products] on [Products].Description = 'Electronics' 
JOIN [OrderDetails_Products] on [OrderDetails_Products].OrderID = [OrderDetails].ID and [OrderDetails_Products].ProductID = [Products].ID

SELECT [Customers].[Name], [Customers].Surname, [Products].Price FROM Customers
JOIN [Orders] on Orders.CustomersID = Customers.ID
JOIN [Products] on Products.Price > 1000
JOIN [OrderDetails] on OrderDetails.OrderID = Orders.ID and OrderDetails.CustomersID = Customers.ID
JOIN [OrderDetails_Products] on [OrderDetails_Products].OrderID = OrderDetails.ID and [OrderDetails_Products].ProductID = Products.ID

CREATE VIEW BonusCustomers as SELECT [Customers].[Name], [Customers].Surname, [BonusCards].CardNumber FROM Customers
JOIN [BonusCards] on BonusCards.CustomerID = Customers.ID

SELECT [Name], [Surname], [BonusCards].Bonus FROM Customers
JOIN BonusCards on BonusCards.CustomerID = Customers.ID and BonusCards.Bonus = 0
