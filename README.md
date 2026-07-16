# 🎬 Netflix Content Analytics Platform

An end-to-end Analytics Engineering project built on the **MovieLens 25M dataset**. This project demonstrates how raw data can be ingested, transformed, modeled, tested, and prepared for analytics using modern data engineering tools and best practices.

---

## 📌 Project Overview

This project builds a production-style analytics warehouse by implementing:

- Automated Python ETL pipelines
- PostgreSQL data warehouse
- dbt transformations
- Dimensional data modeling
- Data quality testing
- Analytics-ready datasets

The goal is to simulate how an Analytics Engineering team would build and maintain a scalable data platform.

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| Programming | Python |
| Database | PostgreSQL |
| Transformation | dbt |
| Query Language | SQL |
| Version Control | Git & GitHub |

---

## 🏗️ Architecture

```
                MovieLens 25M Dataset
                        │
                        ▼
              Python ETL Pipeline
                        │
                        ▼
          PostgreSQL Raw Data Layer
                        │
                        ▼
              dbt Source Definitions
                        │
                        ▼
               dbt Staging Models
                        │
                        ▼
            Intermediate Transformations
                        │
                        ▼
          Dimensional Data Warehouse
                        │
                        ▼
             Analytics Ready Models
```

---

## 📂 Repository Structure

```
Netflix_content_analytics/

├── data/
├── dbt/
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   └── marts/
│   │       ├── dimensions/
│   │       └── facts/
│   ├── macros/
│   ├── snapshots/
│   ├── tests/
│   └── dbt_project.yml
│
├── ingestion/
├── infrastructure/
├── dashboard/
├── requirements.txt
└── README.md
```

---

# ✅ Completed Features

### Data Ingestion

- Python ETL pipeline
- Bulk loading using PostgreSQL `COPY`
- Logging and error handling
- Raw data ingestion of **32+ million records**

---

### Raw Data Warehouse

Implemented raw warehouse tables:

- raw_movies
- raw_ratings
- raw_tags
- raw_links
- raw_genome_scores
- raw_genome_tags

---

### dbt Models

#### Staging Layer

- stg_movies
- stg_ratings
- stg_tags
- stg_links
- stg_genome_scores
- stg_genome_tags

#### Intermediate Layer

- int_movie_genres
- int_movie_statistics
- int_user_statistics

#### Dimensional Warehouse

Dimensions

- dim_movie
- dim_user
- dim_genre

Facts

- fact_ratings
- fact_tags
- fact_genome_scores

Bridge Tables

- bridge_movie_genre

---

## ✅ Data Quality

Implemented dbt tests including:

- Unique tests
- Not Null tests
- Relationship tests
- Accepted Values tests

---

## 📊 Dataset

This project uses the **MovieLens 25M Dataset** published by GroupLens Research.

https://grouplens.org/datasets/movielens/25m/

Dataset files are excluded from this repository.

---

# 🚧 Roadmap

The following features are currently under development:

- dbt Documentation & Lineage
- Source Freshness
- Custom Generic Tests
- Incremental Models
- Performance Optimization
- Airflow Orchestration
- Docker Deployment
- GitHub Actions CI/CD
- Power BI / Tableau Dashboard
- Architecture Diagram
- Production Documentation

---

## 🎯 Learning Objectives

This project demonstrates practical implementation of:

- Analytics Engineering
- ETL Pipelines
- PostgreSQL Data Warehousing
- dbt Transformations
- Dimensional Modeling
- Data Quality Testing
- Production Data Pipelines

---

## 📄 License

This project is intended for educational and portfolio purposes.
