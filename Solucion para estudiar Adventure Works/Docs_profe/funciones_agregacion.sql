select * from Sales.SalesTerritory;

select SalesYTD from Sales.SalesTerritory;
-- suma de todos los valores de la columna SalesYTD
select sum(SalesYTD) as total_sales from Sales.SalesTerritory;

select avg(SalesYTD) as avera_sales from Sales.SalesTerritory;

select sum(SalesYTD) as total_sales, avg(SalesYTD) as avera_sales from Sales.SalesTerritory;

-- suma de todos los valores de la columna SalesYTD que tienen el mismo valor en Country region code
select [name],[CountryRegionCode] , sum(SalesYTD) as total_sales, avg(SalesYTD) as avera_sales from Sales.SalesTerritory
group by [name ],[CountryRegionCode];


--calcula las unidades vendidas de cada producto en el año 2011 
select [ProductID], sum([OrderQty]) from [Sales].[SalesOrderDetail]
where year([ModifiedDate]) = 2011
group by [ProductID];

--indica los 3 productos más vendidos en unidades vendidas en el año 2011
select top(3) [ProductID], sum([OrderQty]) as unidades from [Sales].[SalesOrderDetail]
where year([ModifiedDate]) = 2011
group by [ProductID]
order by unidades desc;
