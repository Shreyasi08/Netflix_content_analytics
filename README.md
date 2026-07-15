# Netflix Content Analytics

An end-to-end analytics engineering project built using the MovieLens 25M dataset. This project demonstrates a modern data pipeline that ingests raw data into PostgreSQL, transforms it using dbt, and models it into an analytics-ready dimensional warehouse.

## Tech Stack

- Python
- PostgreSQL
- dbt (Data Build Tool)
- SQL
- Git & GitHub

## Project Architecture

```
MovieLens Dataset
        │
        ▼
 Python ETL Pipeline
        │
        ▼
 PostgreSQL Raw Layer
        │
        ▼
   dbt Staging Models
        │
        ▼
Intermediate Models
        │
        ▼
Dimensional Warehouse
        │
        ▼
 Analytics & Reporting
```

## Current Progress

- ✅ Python ETL pipeline for MovieLens ingestion
- ✅ Bulk data loading into PostgreSQL
- ✅ Raw data warehouse
- ✅ dbt project configuration
- ✅ Staging models
- ✅ Data quality tests
- ✅ Intermediate transformation models
- ✅ Dimensional data warehouse

## Dataset

This project uses the **MovieLens 25M Dataset** provided by GroupLens Research.

Dataset: https://grouplens.org/datasets/movielens/25m/

> Dataset files are excluded from this repository. Download the dataset and place it inside the `data/` directory before running the pipeline.

## Project Status

🚧 Work in Progress

Upcoming features include:

- Incremental dbt models
- Airflow orchestration
- Docker support
- GitHub Actions CI/CD
- dbt documentation & lineage
- Analytics dashboard
- Production-ready documentation
