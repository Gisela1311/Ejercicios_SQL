import pyodbc

server = "DESKTOP-NKUTOI8"
user = "python_conectar"
password = "conectarpython"
data_base = "Territorios"
conexion_str = "DRIVER={SQL Server};" + f'SERVER={server};DATABASE={data_base};UID={user};PWD={password}'
conn = pyodbc.connect(conexion_str)
cursor = conn.cursor()
cursor.execute('SELECT * FROM [Territorios].[dbo].[Provincias]')
for row in cursor:
    values = [
        row[0],                   # Asumimos que la primera columna es un integer
        row[1],                   # Asumimos que la segunda columna es un string
        row[2],            # Convertimos la tercera columna a Decimal a float
        row[3],            # Convertimos la cuarta columna Decimal a float
        # row[4].strftime("%d/%m/%Y")# Formateamos la quinta columna como fecha datetime
    ]
    print(values)
conn.close()