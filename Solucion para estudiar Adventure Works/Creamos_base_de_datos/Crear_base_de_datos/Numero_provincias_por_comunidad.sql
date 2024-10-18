-- que me indique el numero de provincias que hay en cada Comunidad
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;


--le pedimos que indique el total de población que hay en cada Comunidad
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblación --FORMAT N0 indicarle que es estilo numerico y el 0 para que no imprima el número con decimales
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;

--para ordenar por total de población tenemos que quitar el formato ya que sino se convierte en un string y no lo ordena
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, SUM (p.ProvHab) AS TotalPoblación --FORMAT N0 indicarle que es estilo numerico y el 0 para que no imprima el número con decimales
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
GROUP BY ca.Nombre
ORDER BY TotalPoblación DESC;


--intentando formatear el interior de las celdas de NumerodeProvincias y TotalPoblacion
SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, RIGHT(SPACE(20) + FORMAT(SUM (p.ProvHab), 'N0'), 20) AS TotalPoblación --FORMAT N0 indicarle que es estilo numerico y el 0 para que no imprima el número con decimales
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;
