-- aquí quiero filtrar para que me diga el número de provincias de una CCAA en concreto
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblación 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre = 'Andalucía'
GROUP BY ca.Nombre;

-- quiero saber la población total de España
select FORMAT(SUM (ProvHab), 'N0') as poblacion_españa from Provincias

--mostrar en dos columnas la población por provincias de Galicia, en orden descendente
SELECT p.ProvNom, FORMAT(p.ProvHab, 'N0') AS PoblacionGalicia 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.ComID = 12
ORDER BY p.ProvHab DESC;

--numero de provincias que tiene cada una de las ccaa que terminan con -de 

SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE '%de'
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;

-- ordenar alfabeticamente las provincias cuya población sea en millones
SELECT ProvNom, FORMAT(ProvHab, 'N0') from Provincias
WHERE ProvHab >= 1000000
ORDER BY ProvNom ASC;

--nombre de las 5 provincias con menor población
SELECT TOP 5 ProvNom, FORMAT(ProvHab, 'N0') from Provincias
ORDER BY ProvHab ASC;