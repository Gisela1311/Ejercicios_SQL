--sumar todos los elementos de la columna PesoIng de la tabla Ingredientes Receta
select * from Ingredientesrecetas;

select PesoIng from Ingredientesrecetas	;

select sum(PesoIng) as Peso_Total from Ingredientesrecetas;

-- Como ya he añadido el peso de todos los ingredientes, voy a decirle que me pese solo los tres primeros ingredientes, que son los de la receta de la calabaza

SELECT SUM(PesoIng) AS Peso_Calabaza
FROM (
    SELECT TOP 3 PesoIng
    FROM Ingredientesrecetas
    ORDER BY  IngId
) AS Suma;