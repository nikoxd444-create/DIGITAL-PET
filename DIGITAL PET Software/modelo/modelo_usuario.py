from config.db import conectar
from datetime import datetime

class UsuarioModelo:

    @staticmethod
    def registrar(datos):

        conexion = conectar()
        cursor = conexion.cursor()

        sql = """
        INSERT INTO usuarios (
            ID_ROLES,
            ID_ESTADO,
            USU_CORREO,
            USU_CONTRASENA,
            USU_NOMBRE,
            USU_APELLIDO,
            USU_TELEFONO,
            USU_CEDULA,
            USU_DIRECCION,
            USU_FECHA_REGISTRO
        )
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """

        valores = (
            1,
            1,
            datos["correo"],
            datos["password"],
            datos["nombre"],
            datos["apellido"],
            datos["telefono"],
            datos["cedula"],
            datos["direccion"],
            datetime.now()
        )

        cursor.execute(sql, valores)

        conexion.commit()

        cursor.close()
        conexion.close()