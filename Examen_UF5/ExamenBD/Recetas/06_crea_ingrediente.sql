CREATE TABLE Ingredientes (
    IngId TINYINT PRIMARY KEY IDENTITY(1,1),
	NomIng NVARCHAR (40) NOT NULL,
	TempId TINYINT FOREIGN KEY REFERENCES Temporadas NOT NULL
);