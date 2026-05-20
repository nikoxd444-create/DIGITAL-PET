import mysql.connector

# Conexión a MySQL de XAMPP
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="digital_pet"
)

# Verificar conexión
if conexion.is_connected():
    print("Conexión exitosa")