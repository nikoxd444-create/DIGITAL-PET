from flask import Blueprint, request, jsonify
from config.conexion import conectar

usuario_bp = Blueprint('usuario_bp', __name__)

# GET
@usuario_bp.route('/usuarios', methods=['GET'])
def get_usuarios():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)

    cursor.execute("SELECT * FROM usuarios")
    datos = cursor.fetchall()

    cursor.close()
    conexion.close()

    return jsonify(datos)


# POST
@usuario_bp.route('/usuarios', methods=['POST'])
def crear_usuario():
    data = request.json

    conexion = conectar()
    cursor = conexion.cursor()

    sql = """
    INSERT INTO usuarios (
        ID_ROLES, ID_ESTADO, USU_CORREO,
        USU_CONTRASENA, USU_NOMBRE, USU_APELLIDO, USU_FECHA_REGISTRO
    ) VALUES (%s,%s,%s,%s,%s,%s,NOW())
    """

    valores = (
        data['id_rol'],
        data['id_estado'],
        data['correo'],
        data['contrasena'],
        data['nombre'],
        data['apellido']
    )

    cursor.execute(sql, valores)
    conexion.commit()

    cursor.close()
    conexion.close()

    return jsonify({"msg": "ok"})