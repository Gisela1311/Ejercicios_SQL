CREATE VIEW CCAA_por_Provincias AS
SELECT ca.Nombre, p.ProvNom AS NumerodeProvincias 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID;