from flask import request, redirect
from modelo.usuario_modelo import UsuarioModelo

class UsuarioControlador:

    @staticmethod
    def registrar():

        nombre_completo = request.form["nombre"]

        partes = nombre_completo.split()

        nombre = partes[0]

        apellido = " ".join(partes[1:]) if len(partes) > 1 else ""

        datos = {

            "nombre": nombre,
            "apellido": apellido,
            "correo": request.form["correo"],
            "telefono": request.form["telefono"],
            "cedula": request.form["cedula"],
            "direccion": request.form["direccion"],
            "password": request.form["password"]

        }

        UsuarioModelo.registrar(datos)

        return redirect("/registro")