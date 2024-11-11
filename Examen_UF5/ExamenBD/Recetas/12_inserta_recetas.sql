--Insertar la receta de calabaza
INSERT INTO Recetas (NomRec, ElRec,TRec, DifId, CatId) VALUES
('Sopa de Calabaza', 'Cortar la calabaza (500grm) en cubos y caramelizar la cebolla tierna (150 grm). cocinar hasta que la calabaza esté tierna. Triturar. Servir caliente, decorada con perejil fresco (5 gr).', '30 minutos', 3, 2);

SELECT * from Recetas;

--Creo e inserto dos recetas más
INSERT INTO Recetas (NomRec, ElRec,TRec, DifId, CatId) VALUES
('Tortilla de queso', 'Batir los huevos (300grm) en un plato. Añadir el queso (50grm). Poner en la sartén la mezcla. Voltear cuando se haya cocinado. Servir con unos champiñones(40 grm) salteados.', '60 minutos', 1, 6);

SELECT * from Recetas;

INSERT INTO Recetas (NomRec, ElRec,TRec, DifId, CatId) VALUES
('Entrecot con salsa de pimienta', 'Salpimentar el entrecot (750grm) por ambos lados. En una sartén caliente, poner un poco de aceite y añadir la carne. Cocinar al punto. Retirar la carne. En la misma sartén, hechar nata líquida (100grm) y pimienta (50grm). Esperar a que la nata rompa a hervir y apagar el fuego. Volver a añadir el entrecot y servir caliente. ', '40 minutos', 3, 11);

SELECT * from Recetas;

--he actualizado la receta de la tortilla, así que he borrado la que había insertado originariamente. 
--DELETE FROM Recetas 
--WHERE RecId = 3;
--SELECT * from Recetas;



--Para que me muestre el Nombre de la categoría y de la dificultad en lugar del número del ID, voy a hacer un join

SELECT r.NomRec, r.ElRec, r.TRec, NomCat, NomDif  
FROM [Recetas] as r
inner join [Dificultades] as dif
ON r.difId = dif.DifId
inner join [Categorias] as cat
ON cat.CatId = r.CatId;

