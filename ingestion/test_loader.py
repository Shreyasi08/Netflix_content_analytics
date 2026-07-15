from postgres_loader import PostgresLoader
loader=PostgresLoader()
if loader.test_connection():
    print("Connected!!")