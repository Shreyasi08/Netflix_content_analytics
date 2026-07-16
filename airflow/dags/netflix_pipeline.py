from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator

PROJECT_DIR = "/opt/project"

default_args = {
    "owner": "shreyasi",
    "retries": 1,
}

with DAG(
    dag_id="netflix_analytics_pipeline",
    default_args=default_args,
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["netflix", "dbt", "analytics"],
) as dag:

    ingest = BashOperator(
        task_id="ingest_movielens_data",
        bash_command=f"""
        cd {PROJECT_DIR}
        python3 ingestion/load_to_postgres.py
        """
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"""
        cd {PROJECT_DIR}/dbt
        dbt run
        """
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"""
        cd {PROJECT_DIR}/dbt
        dbt test
        """
    )

    ingest >> dbt_run >> dbt_test