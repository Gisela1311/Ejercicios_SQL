select pp.PhoneNumber, pp.PhoneNumberTypeID, p.LastName from [Person].[Person] as p
inner join [Person].[PersonPhone] as pp
on pp.BusinessEntityID = p.BusinessEntityID
where pp.PhoneNumberTypeID  = 2;


