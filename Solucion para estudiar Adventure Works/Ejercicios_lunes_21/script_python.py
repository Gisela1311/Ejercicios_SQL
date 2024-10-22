import pyodbc

server = "DESKTOP-NKUTOI8"
user = "python_conectar"
password = "conectarpython"
data_base = "Territorios"
conexion_str = "DRIVER={SQL Server};" + f'SERVER={server};DATABASE={data_base};UID={user};PWD={password}'
conn = pyodbc.connect(conexion_str)
cursor = conn.cursor()

query1 = '''SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblación --FORMAT N0 indicarle que es estilo numerico y el 0 para que no imprima el número con decimales
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre = 'Andalucía'
GROUP BY ca.Nombre;'''

query2 = '''select FORMAT(SUM (ProvHab), 'N0') AS poblacion_españa from Provincias'''

query3 = '''SELECT p.ProvNom, FORMAT(p.ProvHab, 'N0') AS PoblacionGalicia 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.ComID = 12
ORDER BY p.ProvHab DESC;'''

query4 = ''' SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE '%de'
GROUP BY ca.Nombre
ORDER BY NumerodeProvincias DESC;'''

query5 = ''' SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
WHERE ProvHab >= 1000000
ORDER BY ProvNom ASC;'''

query6 = '''SELECT TOP 5 ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
ORDER BY ProvHab ASC;'''

query7 = '''SELECT ProvNom, FORMAT(ProvHab, 'N0') AS Población from Provincias
WHERE Len(ProvNom) = 7 AND (ProvHab BETWEEN 150000 AND 200000) OR (ProvHab BETWEEN 900000 AND 1000000);'''

query8  = ''' SELECT FORMAT(SUM (p.ProvHab), 'N0') AS "Población de las provincias de las comunidades autonomas que empiezan por M"
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre LIKE 'M%';'''

query9 = '''SELECT ca.Nombre, COUNT (p.ProvId) AS NumeroProvincias
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ProvHab BETWEEN 700000 AND 800000
GROUP BY ca.Nombre
ORDER BY NumeroProvincias DESC;'''

# query10 = '''DECLARE @columnas NVARCHAR(MAX);

# SELECT @columnas = STRING_AGG(QUOTENAME(Nombre), ',')
# FROM (SELECT distinct ca.Nombre AS Nombre 
# FROM [Provincias] AS p
# inner join [ComunidadesAutonomas] AS ca
# ON ca.ComID = p.ComID
# WHERE ProvHab >= 1000000) as SourceTable
# select @columnas;

# DECLARE @sql NVARCHAR(MAX);

# SET @sql ='
# SELECT Provincia, ' + @columnas + ' 
# FROM 
# (
# 	SELECT p.ProvNom AS Provincia, ca.Nombre AS ComunidadAutonoma, ProvHab 
# FROM [Provincias] AS p
# inner join [ComunidadesAutonomas] AS ca
# ON ca.ComID = p.ComID
# WHERE ProvHab >= 1000000
# ) AS SourceTable
# PIVOT 
# (
# 	SUM(ProvHab)
# 	FOR ComunidadAutonoma IN (' + @columnas + ')
# ) AS PivotTable';
# EXEC sp_executesql @sql;
# '''

cursor.execute(query1)
result1 = cursor.fetchall()

for row in result1:
    values = [
        row[0],                   # Asumimos que la primera columna es un integer
        row[1],                   # Asumimos que la segunda columna es un string
    ]
    print(f"{row[0]} tiene {row[1]} provincias" + '\n') 

cursor.execute(query2)
result2 = cursor.fetchall()

for row in result2:
    values = [
        row[0]
    ]
    print(f"España tiene {row[0]} habitantes" + '\n') 

cursor.execute(query3)
result3 = cursor.fetchall()
    
print("Lista de las provincias de Galicia y sus respectivos habitantes:  " + '\n') 
for row in result3:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

cursor.execute(query4)
result4 = cursor.fetchall()

print("Listado de provincias terminadas por -de y número de provincias que tiene: " + '\n')  
for row in result4:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")   

cursor.execute(query5)
result5 = cursor.fetchall()

print("Listado de provincias con población superior a un millón, ordanadas alfabéticamente: " + '\n')  
for row in result5:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

cursor.execute(query6)
result6 = cursor.fetchall()

print("TOP 5 provincias con menor población de España: " + '\n')  
for row in result6:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

cursor.execute(query7)
result7 = cursor.fetchall()

print("Províncias con nombre de 7 letras y con población bien entre 150 y 200 mil hab o bien entre 900mil y 1 millón hab " + '\n')  
for row in result7:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

cursor.execute(query8)
result8 = cursor.fetchall()

columnas = [desc[0] for desc in cursor.description]
print(columnas)  
for row in result8:
    values = [
        row[0]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

cursor.execute(query9)
result9 = cursor.fetchall()

print("Número de provincias con población entre 700 y 800 mil hab. y CCAA a la que pertenecen: " + '\n')  
for row in result9:
    values = [
        row[0],
        row[1]
    ]
    print(values) 

print("\n ----------------------------------------------------------------------------------------")

sql_columnas = """
DECLARE @columnas NVARCHAR(MAX);
SELECT @columnas = STRING_AGG(QUOTENAME(Nombre), ',')
FROM (SELECT distinct ca.Nombre AS Nombre 
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ProvHab >= 1000000) as SourceTable
select @columnas;"""

cursor.execute(sql_columnas)
columnas = cursor.fetchone().columnas

sql_dinamica = f"""
SELECT Provincia, {columnas}  
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
	FOR ComunidadAutonoma IN ({columnas})
) AS PivotTable;
"""
cursor.execute(sql_dinamica)
filas = cursor.fetchall()

nombres_columnas = [column[0] for column in cursor.description]

print(nombres_columnas)
for fila in filas:
    print(fila)

conn.close()