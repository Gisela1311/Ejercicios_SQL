import pyodbc

server = "DESKTOP-NKUTOI8"
user = "python_conectar"
password = "conectarpython"
data_base = "Territorios"
conexion_str = "DRIVER={SQL Server};" + f'SERVER={server};DATABASE={data_base};UID={user};PWD={password}'
conn = pyodbc.connect(conexion_str)
cursor = conn.cursor()
cursor.execute('''SELECT ca.Nombre, COUNT (p.ProvId) AS NumerodeProvincias, FORMAT(SUM (p.ProvHab), 'N0') AS TotalPoblación --FORMAT N0 indicarle que es estilo numerico y el 0 para que no imprima el número con decimales
FROM [Provincias] AS p
inner join [ComunidadesAutonomas] AS ca
ON ca.ComID = p.ComID
WHERE ca.Nombre = 'Andalucía'
GROUP BY ca.Nombre;''')
for row in cursor:
    values = [
        row[0],                   # Asumimos que la primera columna es un integer
        row[1],                   # Asumimos que la segunda columna es un string
        # row[2],            # Convertimos la tercera columna a Decimal a float
        # row[3],            # Convertimos la cuarta  columna Decimal a float
        # row[4].strftime("%d/%m/%Y")# Formateamos la quinta columna como fecha datetime
    ]
    print(values)
conn.close()