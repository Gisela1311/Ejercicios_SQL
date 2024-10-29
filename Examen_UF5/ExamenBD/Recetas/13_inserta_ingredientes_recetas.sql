-- Insertar ingredientes y pesos receta calabaza
INSERT INTO Ingredientesrecetas (IngId, PesoIng, TempId) VALUES 
(3, 500, 4),
(29, 150, 2),
(40, 5, 3);

select * from Ingredientesrecetas;

-- QUiero que me muestre el nombre del ingrediente en lugar del Id del ingrediente

SELECT NomIng, inre.PesoIng  
FROM [Ingredientes] as ing
inner join [Ingredientesrecetas] as inre
ON inre.IngId = ing.IngId;

-- Añado los ingredientes y pesos de las recetas 2 y 3

INSERT INTO Ingredientesrecetas (IngId, PesoIng, TempId) VALUES 
(41, 300, 2),
(42, 50, 3),
(4, 404, 4),
(43, 750,2),
(44, 100, 4),
(45, 50, 2);

select * from Ingredientesrecetas;

