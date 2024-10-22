import tkinter as tk
from tkinter import messagebox
import pyodbc

server = "DESKTOP-NKUTOI8"
user = "python_conectar"
password = "conectarpython"
data_base = "Almacen"
conexion_str = "DRIVER={SQL Server};" + f'SERVER={server};DATABASE={data_base};UID={user};PWD={password}'

def obtener_tipos():
    try:
        conexion = pyodbc.connect(conexion_str)
        cursor = conexion.cursor()
        cursor.execute("SELECT TipId, TipNom FROM Tipos")
        tipos = cursor.fetchall()
        conexion.close()
        return tipos
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return []
    
def obtener_estanterias():
    try:
        conexion = pyodbc.connect(conexion_str)
        cursor = conexion.cursor()
        cursor.execute("SELECT  [EstId] ,[EstNum] ,[EstLo]      ,[EstAl]  FROM [Almacen].[dbo].[Estanterias]")
        tipos = cursor.fetchall()
        conexion.close()
        return tipos
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return []

def insertar_datos():
    nombre = entry_nombre.get()
    valor = float(entry_valor.get())
    tipo_id = int(combo_tipos.get().split('-')[0].strip())
    estanteria_id = int(combo_estanterias.get().split('-')[0].strip())

    try:
        conexion = pyodbc.connect(conexion_str)
        cursor = conexion.cursor()
        cursor.execute("""
            INSERT INTO Objetos (ObNom, ObVal, TipId, EstId)
            VALUES (?, ?, ?, ?)
        """, (nombre, valor, tipo_id, estanteria_id))
        conexion.commit()
        messagebox.showinfo("Éxito", "Datos insertados correctamente")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conexion.close()

app = tk.Tk()
app.title("Formulario de Entrada de Datos para el Almacén")

# Etiquetas y campos de entrada
tk.Label(app, text="Nombre:").grid(row=0, column=0)
tk.Label(app, text="Valor:").grid(row=1, column=0)
tk.Label(app, text="Tipo:").grid(row=2, column=0)

entry_nombre = tk.Entry(app)
entry_valor = tk.Entry(app)

entry_nombre.grid(row=0, column=1)
entry_valor.grid(row=1, column=1)

# Crear un combobox para Tipos
tipos = obtener_tipos()
combo_tipos = tk.StringVar()
dropdownt = tk.OptionMenu(app, combo_tipos,"Mis tipos", *[f"{tipo[0]} - {tipo[1]}" for tipo in tipos])
dropdownt.grid(row=2, column=1)

# Crear un combobox para Estanterias
estanterias = obtener_estanterias()
combo_estanterias = tk.StringVar()
dropdowne = tk.OptionMenu(app, combo_estanterias,"Mis estanterias", *[f"{tipo[0]} - {tipo[1]} - {tipo[2]} - {tipo[3]}" for tipo in estanterias])
dropdowne.grid(row=3, column=1)

# Botón de insertar
tk.Button(app, text="Insertar", command=insertar_datos).grid(row=4, column=0, columnspan=2)

app.mainloop()
