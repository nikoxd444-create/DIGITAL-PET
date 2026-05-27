from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# BD
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///digitalpet.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# MODELO
class Usuario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(120))
    usuario = db.Column(db.String(80))
    email = db.Column(db.String(120))
    rol = db.Column(db.String(50))
    estado = db.Column(db.String(20))

# CREAR TABLAS
with app.app_context():
    db.create_all()


# =====================
# GET USUARIOS
# =====================
@app.route("/usuarios", methods=["GET"])
def get_users():
    users = Usuario.query.all()
    return jsonify([
        {
            "id": u.id,
            "nombre": u.nombre,
            "usuario": u.usuario,
            "email": u.email,
            "rol": u.rol,
            "estado": u.estado
        }
        for u in users
    ])


# =====================
# POST USUARIO
# =====================
@app.route("/usuarios", methods=["POST"])
def add_user():
    data = request.json

    user = Usuario(
        nombre=data["nombre"],
        usuario=data["usuario"],
        email=data["email"],
        rol=data["rol"],
        estado=data["estado"]
    )

    db.session.add(user)
    db.session.commit()

    return jsonify({"ok": True})


if __name__ == "__main__":
    app.run(debug=True)