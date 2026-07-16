# 🎬 Netflix Content Analytics Platform

![Python](https://img.shields.io/badge/Python-3.12-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue)
![dbt](https://img.shields.io/badge/dbt-Core-orange)
![SQL](https://img.shields.io/badge/SQL-Analytics-success)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)

A production-style **Analytics Engineering** project built using the **MovieLens 25M dataset**. This project demonstrates how modern data teams ingest, transform, validate, and model large-scale datasets into an analytics-ready dimensional warehouse using **Python**, **PostgreSQL**, and **dbt**.

The platform processes **32+ million records** across multiple datasets and follows analytics engineering best practices including layered dbt transformations, dimensional modeling, and automated data quality testing.

---

# 🏗️ Architecture

This project follows the modern **ELT (Extract → Load → Transform)** architecture.

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
                      Staging Transformations
                               │
                               ▼
                 Intermediate Business Models
                               │
                               ▼
                Dimensional Data Warehouse
                               │
                               ▼
                    Analytics Ready Models
                               │
                               ▼
                   Business Intelligence
```

---

# 🛠 Tech Stack

| Category | Technologies |
|-----------|--------------|
| Programming | Python |
| Data Warehouse | PostgreSQL |
| Data Transformation | dbt Core |
| Query Language | SQL (Jinja-templated) |
| Data Modeling | Kimball Star Schema |
| Version Control | Git & GitHub |

---

# 📊 Data Warehouse Architecture

The warehouse follows a layered dbt architecture inspired by modern Analytics Engineering practices.

```
Raw Sources
      │
      ▼
 Staging Models
      │
      ▼
Intermediate Models
      │
      ▼
Dimensions
      │
      ▼
Facts
      │
      ▼
Reporting Models
```

---

# ⭐ Data Model

## Fact Tables

### fact_ratings

Central fact table containing every movie rating event.

Stores

- User
- Movie
- Rating
- Timestamp

Used for:

- Recommendation analytics
- Rating trends
- User behavior analysis

---

### fact_tags

Stores user-generated movie tags.

---

### fact_genome_scores

Stores relevance scores between movies and genome tags for content-based recommendation analysis.

---

## Dimension Tables

### dim_movie

Movie metadata enriched with aggregated statistics including

- Average Rating
- Rating Count
- First Rating Date
- Last Rating Date

---

### dim_user

Aggregated user activity including

- Total Ratings
- Average Rating Given
- Activity Dates

---

### dim_genre

Lookup dimension for movie genres.

---

# 📈 dbt Layers

## Raw Layer

Stores unmodified MovieLens datasets loaded from CSV into PostgreSQL.

---

## Staging Layer

- Standardized naming conventions
- Type casting
- Timestamp conversion
- Source abstraction

---

## Intermediate Layer

Reusable business transformations including

- Genre normalization
- Movie statistics
- User statistics

---

## Dimensional Layer

Implements a Kimball-style star schema optimized for analytical workloads.

---

# ✅ Data Quality

Implemented using dbt tests.

Current validations include

- ✔ Not Null Tests
- ✔ Unique Tests
- ✔ Relationship Tests
- ✔ Accepted Values Tests

---

# 🚀 Features

- End-to-end Python ETL pipeline
- PostgreSQL data warehouse
- dbt transformation pipeline
- Layered analytics engineering architecture
- Star schema dimensional modeling
- Automated data quality testing
- Modular SQL transformations
- Processing of **32+ million records**

---

# 📂 Repository Structure

```
Netflix_content_analytics

├── ingestion/
├── dbt/
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   ├── marts/
│   │   └── reporting/
│   ├── tests/
│   ├── macros/
│   └── snapshots/
│
├── dashboard/
├── infrastructure/
├── data/
└── README.md
```

---

# 💻 Running the Project

### Clone Repository

```bash
git clone https://github.com/Shreyasi08/Netflix_content_analytics.git

cd Netflix_content_analytics
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Configure PostgreSQL

Update

```
ingestion/config.py
```

with your PostgreSQL credentials.

---

### Load Raw Data

```bash
python ingestion/load_to_postgres.py
```

---

### Execute dbt Models

```bash
cd dbt

dbt run
```

---

### Run Data Quality Tests

```bash
dbt test
```

---

### Generate Documentation

```bash
dbt docs generate
dbt docs serve
```

---

# 📊 Dataset

MovieLens 25M Dataset

https://grouplens.org/datasets/movielens/25m/

---

# 🚧 Upcoming Enhancements

- Airflow orchestration
- Docker deployment
- GitHub Actions CI/CD
- Reporting models
- Power BI Dashboard
- Incremental dbt models
- Source freshness monitoring

---

# 📜 License

This repository is intended for educational and portfolio purposes.
