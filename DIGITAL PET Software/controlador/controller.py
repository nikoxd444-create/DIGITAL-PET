# controllers/user_controller.py
from fastapi import APIRouter
from models.user import User

router = APIRouter()

users = [
    {"id": 1, "name": "Carlos Ramírez", "email": "cramirez@happypet.com", "rol": "Administrador"}
]

@router.get("/users")
def get_users():
    return users

@router.post("/users")
def create_user(user: dict):
    users.append(user)
    return {"message": "Usuario creado"}