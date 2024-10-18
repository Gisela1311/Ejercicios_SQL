select p.LastName, c.Name from [Person].[Person] as p
left join [Person].[BusinessEntity] as be
on be.BusinessEntityID = p.BusinessEntityID
left join [Person].[BusinessEntityAddress] as bea
on bea.BusinessEntityID = be.BusinessEntityID
left join [Person].[Address] as a
on a.AddressID = bea.AddressID
left join [Person].[StateProvince] as s
on s.StateProvinceID = a.StateProvinceID
left join [Person].[CountryRegion] as c
on c.CountryRegionCode = s.CountryRegionCode
where c.Name is null;