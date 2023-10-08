create table Persons 
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] nvarchar(80) NOT NULL,
	[Surname] nvarchar(100) NOT NULL
)

create table LocalPassport
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Person_ID] int FOREIGN KEY REFERENCES Persons(ID) NOT NULL,
	[PassportNumber] int NOT NULL,
	[FIN] nvarchar(100) NOT NULL
)

create table ForeignPassport
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Person_ID] int FOREIGN KEY REFERENCES Persons(ID) NOT NULL,
	[PassportNumber] nvarchar(80) NOT NULL,
	[Issue] date NOT NULL,
	[Expiration] date NOT NULL
)

create table Structures
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(200) NOT NULL,
	[Location] nvarchar(100) NOT NULL
)

create table Documents
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] nvarchar(200) NOT NULL,
	[Description] date NOT NULL,
	[Structure_ID] int FOREIGN KEY REFERENCES Structures(ID)
)

create table RealEstate
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[LocalPassport_ID] int FOREIGN KEY REFERENCES LocalPassport(ID),
	[Document_ID] int FOREIGN KEY REFERENCES Documents(ID),
	[Location] nvarchar(100) NOT NULL,
	[Price] money NOT NULL
)

create table MovableEstate
(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[LocalPassport_ID] int FOREIGN KEY REFERENCES LocalPassport(ID),
	[Document_ID] int FOREIGN KEY REFERENCES Documents(ID),
	[Price] money NOT NULL
)