select bea.BusinessEntityID, a.AddressID from [Person].[Person] as p
inner join [Person].[BusinessEntity] as be
on be.BusinessEntityID = p.BusinessEntityID
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
where ty.AddressTypeID = 5;