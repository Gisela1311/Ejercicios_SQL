/* este comentarios
ocupa varias lineas
*/

-- muestra todas las columnas de una tabla y todas las filas
select * from Sales.SalesTerritory;
-- muestras algunas columnas de una tabla y todas las filas
select [Name] as nombre, [CountryRegionCode] as pais, [SalesLastYear] from Sales.SalesTerritory;
-- muestra todas las columnas de una tabla y algunas filas
select * from Sales.SalesTerritory
where CountryRegionCode = 'US';
-- muestra algunas columnas de una tabla y algunas filas
select [Name] as nombre, [CountryRegionCode] as pais, [SalesLastYear]  from Sales.SalesTerritory
where CountryRegionCode = 'US' or CountryRegionCode = 'AU';

select [Name] as nombre, [CountryRegionCode] as pais, [SalesLastYear]  from Sales.SalesTerritory
where CountryRegionCode in ('US','AU');

select [Name] as nombre, [CountryRegionCode] as pais, [SalesLastYear]  from Sales.SalesTerritory
where CountryRegionCode not in ('US','AU');

select [Name] as nombre, [CountryRegionCode] as pais, [SalesLastYear]  from Sales.SalesTerritory
where CountryRegionCode <> 'US' and SalesLastYear > 2000000;