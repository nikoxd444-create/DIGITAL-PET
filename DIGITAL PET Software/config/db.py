import pymysql

def conectar():

    conexion = pymysql.connect(
        host="localhost",
        user="root",
        password="",
        database="digital_pet",
        cursorclass=pymysql.cursors.DictCursor
    )

    return conexion