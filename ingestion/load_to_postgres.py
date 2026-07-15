from pathlib import Path

from postgres_loader import PostgresLoader
from schema_config import TABLE_CONFIG
from logger import logger

DATA_DIR = Path("data")


def main():

    loader = PostgresLoader()

    logger.info("=" * 60)
    logger.info("Starting MovieLens Ingestion")
    logger.info("=" * 60)

    for filename, config in TABLE_CONFIG.items():

        table = config["table"]
        filepath = DATA_DIR / filename

        logger.info(f"Loading {filename}")

        try:

            loader.truncate(table)

            loader.copy_csv(
                filepath,
                table
            )

            rows = loader.count_rows(table)
            loader.log_ingestion(
    filename,
    table,
    rows,
    "SUCCESS"
)

            logger.info(
                f"Loaded {rows:,} rows into {table}"
            )

        except Exception as e:
            loader.log_ingestion(
    filename,
    table,
    0,
    "FAILED",
    str(e),
)

            logger.exception(e)

    logger.info("=" * 60)
    logger.info("Ingestion Complete")
    logger.info("=" * 60)


if __name__ == "__main__":
    main()