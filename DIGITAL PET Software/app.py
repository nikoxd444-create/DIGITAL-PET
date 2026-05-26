from flask import Flask, render_template
from controlador.usuario_controlador import UsuarioControlador

app = Flask(__name__, template_folder="vista")

@app.route("/")
def inicio():

    return render_template("index.html")


@app.route("/registro")
def registro():

    return render_template("registro.html")


@app.route("/guardar_usuario", methods=["POST"])
def guardar_usuario():

    return UsuarioControlador.registrar()


if __name__ == "__main__":
    app.run(debug=True)