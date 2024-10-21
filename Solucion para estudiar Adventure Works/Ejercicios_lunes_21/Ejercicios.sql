-- EJERCICIO 1	aquí quiero filtrar para que me diga el número de provincias de una CCAA en concreto
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblación 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre = 'Andalucía'
GROUP BY ca.Nombre;

--EJERCICIO 2quiero saber la población total de España
select FORMAT(SUM (ProvHab), 'N0') as poblacion_españa from Provincias

-- EJERCICIO 3 mostrar en dos columnas la población por provincias de Galicia, en orden descendente
SELECT p.ProvNom, FORMAT(p.ProvHab, 'N0') AS PoblacionGalicia 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.ComID = 12
ORDER BY p.ProvHab DESC;

--EJERCICIO 4 numero de provincias que tiene cada una de las ccaa que terminan con -de 

SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE '%de'
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;

-- EJERCICIO 5 ordenar alfabeticamente las provincias cuya población sea en millones
SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
WHERE ProvHab >= 1000000
ORDER BY ProvNom ASC;

-- EJERCICIO 6 nombre de las 5 provincias con menor población
SELECT TOP 5 ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
ORDER BY ProvHab ASC;

-- EJERCICIO 7 provincias con nombre de 7 letras y con población entre 100 y 200 mil o bien entre 900mil y 1 millon
SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
WHERE Len(ProvNom) = 7 AND (ProvHab BETWEEN 150000 AND 200000) OR (ProvHab BETWEEN 900000 AND 1000000);

-- EJERCICIO 8 Población total de las ccaa que empiezan por M . Aplicar formato
SELECT FORMAT(SUM (p.ProvHab), 'N0') AS "Población de las provincias de las comunidades autonomas que empiezan por M"
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE 'M%';

-- EJERCICIO 9 nombres de las ccaa que tengan alguna provincia con poblacion entre 700 y 800 mil hab. orden descendente.
SELECT ca.Nombre, COUNT (p.ProvId) AS NumeroProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ProvHab BETWEEN 700000 AND 800000
GROUP BY ca.Nombre
ORDER BY NumeroProvincias DESC;

--EJERCICIO 10 ordenar alfabeticamente las prov con hab >1 millón. hay que mostrar una columna por cada ccaa
DECLARE @columnas NVARCHAR(MAX);

SELECT @columnas = STRING_AGG(QUOTENAME(Nombre), ',')
FROM (SELECT distinct ca.Nombre AS Nombre 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ProvHab >= 1000000) as SourceTable
select @columnas;

DECLARE @sql NVARCHAR(MAX);

SET @sql ='
SELECT Provincia, ' + @columnas + ' 
FROM 
(
	SELECT p.ProvNom AS Provincia, ca.Nombre AS ComunidadAutonoma, ProvHab 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ProvHab >= 1000000
) AS SourceTable
PIVOT 
(
	SUM(ProvHab)
	FOR ComunidadAutonoma IN (' + @columnas + ')
) AS PivotTable';
EXEC sp_executesql @sql;
