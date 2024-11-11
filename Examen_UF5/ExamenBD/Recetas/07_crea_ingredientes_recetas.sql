CREATE TABLE Ingredientesrecetas (
	id tinyint identity(1,1) not null primary key,
	IngId TINYINT FOREIGN KEY REFERENCES Ingredientes NOT NULL, 
	PesoIng SMALLINT CHECK (PesoIng> 0) NOT NULL,
	RecId TINYINT FOREIGN KEY REFERENCES Recetas NOT NULL
);