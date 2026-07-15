from sqlalchemy import create_engine
from config import DB_CONFIG

# Create database connection string
DATABASE_URL = (
    f"postgresql+psycopg2://{DB_CONFIG['user']}:{DB_CONFIG['password']}"
    f"@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
)

try:
    engine = create_engine(DATABASE_URL)

    with engine.connect() as conn:
        print("✅ Successfully connected to PostgreSQL!")

except Exception as e:
    print("❌ Connection failed")
    print(e)