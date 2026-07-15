from sqlalchemy import create_engine, text
from config import DB_CONFIG


class PostgresLoader:
    """
    Handles PostgreSQL database operations.
    """

    def __init__(self):
        database_url = (
            f"postgresql+psycopg2://"
            f"{DB_CONFIG['user']}:"
            f"{DB_CONFIG['password']}@"
            f"{DB_CONFIG['host']}:"
            f"{DB_CONFIG['port']}/"
            f"{DB_CONFIG['database']}"
        )

        self.engine = create_engine(database_url)

    def test_connection(self):
        with self.engine.connect():
            return True

    def execute(self, sql):
        with self.engine.begin() as conn:
            conn.execute(text(sql))

    def truncate(self, table_name):
        self.execute(f"TRUNCATE TABLE {table_name};")

    def copy_csv(self, csv_path, table_name):
        raw = self.engine.raw_connection()

        try:
            cursor = raw.cursor()

            with open(csv_path, "r", encoding="utf-8") as file:
                next(file)

                cursor.copy_expert(
                    f"""
                    COPY {table_name}
                    FROM STDIN
                    WITH (
                        FORMAT CSV
                    );
                    """,
                    file,
                )

            raw.commit()

        finally:
            raw.close()

    def count_rows(self, table_name):
        with self.engine.connect() as conn:
            result = conn.execute(
                text(f"SELECT COUNT(*) FROM {table_name}")
            )
            return result.scalar()

    def log_ingestion(
        self,
        filename,
        table,
        rows,
        status,
        error=None,
    ):
        sql = text("""
            INSERT INTO raw.ingestion_log
            (
                file_name,
                table_name,
                rows_loaded,
                load_start,
                load_end,
                status,
                error_message
            )
            VALUES
            (
                :filename,
                :table,
                :rows,
                NOW(),
                NOW(),
                :status,
                :error
            )
        """)

        with self.engine.begin() as conn:
            conn.execute(
                sql,
                {
                    "filename": filename,
                    "table": table,
                    "rows": rows,
                    "status": status,
                    "error": error,
                },
            )