select sa.Name, c.Name, ty.name from [Sales].[Store] as sa
inner join [Person].[BusinessEntity] as be
on be.BusinessEntityID = sa.BusinessEntityID
inner join [Person].[BusinessEntityAddress] as bea
on bea.BusinessEntityID = be.BusinessEntityID
inner join [Person].[Address] as a
on a.AddressID = bea.AddressID
inner join [Person].[StateProvince] as s
on s.StateProvinceID = a.StateProvinceID
inner join [Person].[CountryRegion] as c
on c.CountryRegionCode = s.CountryRegionCode
inner join [Person].[AddressType] as ty
on ty.AddressTypeID = bea.AddressTypeID
where c.Name = 'United States';
