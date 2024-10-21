-- EJERCICIO 1	aqu� quiero filtrar para que me diga el n�mero de provincias de una CCAA en concreto
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblaci�n 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre = 'Andaluc�a'
GROUP BY ca.Nombre;

--EJERCICIO 2quiero saber la poblaci�n total de Espa�a
select FORMAT(SUM (ProvHab), 'N0') as poblacion_espa�a from Provincias

-- EJERCICIO 3 mostrar en dos columnas la poblaci�n por provincias de Galicia, en orden descendente
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

-- EJERCICIO 5 ordenar alfabeticamente las provincias cuya poblaci�n sea en millones
SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Poblaci�n from Provincias
WHERE ProvHab >= 1000000
ORDER BY ProvNom ASC;

-- EJERCICIO 6 nombre de las 5 provincias con menor poblaci�n
SELECT TOP 5 ProvNom, FORMAT(ProvHab, 'N0') AS Poblaci�n from Provincias
ORDER BY ProvHab ASC;

-- EJERCICIO 7 provincias con nombre de 7 letras y con poblaci�n entre 100 y 200 mil o bien entre 900mil y 1 millon
SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Poblaci�n from Provincias
WHERE Len(ProvNom) = 7 AND (ProvHab BETWEEN 150000 AND 200000) OR (ProvHab BETWEEN 900000 AND 1000000);

-- EJERCICIO 8 Poblaci�n total de las ccaa que empiezan por M . Aplicar formato
SELECT FORMAT(SUM (p.ProvHab), 'N0') AS "Poblaci�n de las provincias de las comunidades autonomas que empiezan por M"
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE 'M%';

-- EJERCICIO 9 