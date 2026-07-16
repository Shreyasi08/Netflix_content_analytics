from dotenv import load_dotenv
import os

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("POSTGRES_HOST", os.getenv("DB_HOST")),
    "port": int(os.getenv("POSTGRES_PORT", os.getenv("DB_PORT", "5432"))),
    "database": os.getenv("POSTGRES_DB", os.getenv("DB_NAME")),
    "user": os.getenv("POSTGRES_USER", os.getenv("DB_USER")),
    "password": os.getenv("POSTGRES_PASSWORD", os.getenv("DB_PASSWORD")),
}