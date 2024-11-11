-- Insertar ingredientes y pesos receta calabaza
Use RecetasBD;
GO

INSERT INTO Ingredientesrecetas (IngId, PesoIng, RecId) VALUES 
(3, 500, 1),
(29, 150, 1),
(40, 5, 1);



-- Añado los ingredientes y pesos de las recetas 2 y 3

INSERT INTO Ingredientesrecetas (IngId, PesoIng, RecId) VALUES 
(41, 300, 2),
(42, 50, 2),
(4, 404, 2),
(43, 750,3),
(44, 100, 3),
(45, 50, 3);



-- QUiero que me muestre el nombre del ingrediente en lugar del Id del ingrediente

