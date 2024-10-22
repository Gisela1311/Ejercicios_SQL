-- EJERCICIO WORD 2
--Crear base de datos: la llamamos ALMACEN
--Creamos las tablas:
CREATE TABLE Estanterias (
    EstId SMALLINT PRIMARY KEY IDENTITY(1,1),
	EstNum TINYINT CHECK (EstNum BETWEEN 1 AND 10) NOT NULL,
	EstLo TINYINT CHECK (EstLo BETWEEN 1 AND 3) NOT NULL,
	EstAl TINYINT CHECK (EstAl BETWEEN 1 AND 20) NOT NULL
);

CREATE TABLE Tipos (
	TipId SMALLINT PRIMARY KEY IDENTITY(1,1),
	TipNom NVARCHAR (30) NOT NULL
);

CREATE TABLE Objetos (
	ObNom VARCHAR (30) NOT NULL,
	ObId SMALLINT PRIMARY KEY IDENTITY(1,1),
	ObVal SMALLINT CHECK (ObVal > 0) NOT NULL,
	TipId SMALLINT FOREIGN KEY REFERENCES Tipos NOT NULL, 
	EstId SMALLINT FOREIGN KEY REFERENCES Estanterias NOT NULL
);

-- Crear las relaciones mediante Diagrama
-- añadimos unas cuantas estanterías y unos cuantos tipos a mano

INSERT INTO Estanterias VALUES (1, 1, 1);
INSERT INTO Estanterias VALUES (2, 1, 1);
INSERT INTO Estanterias VALUES (1, 2, 1);

INSERT INTO Tipos VALUES ('Ropa Mujer');
INSERT INTO Tipos VALUES ('Ropa Hombre');
INSERT INTO Tipos VALUES ('Ropa Infantil');
INSERT INTO Tipos VALUES ('Menaje');
INSERT INTO Tipos VALUES ('Ropa de Cama');


--crear un formulario de entrada de objetos en Visual Studio Code

--

