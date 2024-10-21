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

# query4=
# query5=
# query6=
# query7=
# query8=
# query9=
# query10=

cursor.execute(query1)
result1 = cursor.fetchall()

for row in result1:
    values = [
        row[0],                   # Asumimos que la primera columna es un integer
        row[1],                   # Asumimos que la segunda columna es un string
    ]
    print(f"{row[0]} tiene {row[1]} provincias")

cursor.execute(query2)
result2 = cursor.fetchall()

for row in result2:
    values = [
        row[0]
    ]
    print(f"España tiene {row[0]} habitantes")

cursor.execute(query3)
result3 = cursor.fetchall()
    
print("Lista de las provincias de Galicia y sus respectivos habitantes:  ")
for row in result3:
    values = [
        row[0],
        row[1]
    ]
    print(values)
    
conn.close()