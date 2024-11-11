SELECT NomRec , sum(inre.PesoIng)
FROM [Ingredientes] as ing
inner join [Ingredientesrecetas] as inre
ON inre.IngId = ing.IngId
inner join [Recetas] as re
ON re.RecId = inre.RecID
where inre.RecId = 1
group by NomRec;