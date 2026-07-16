# Performance Optimizations

## Incremental Models

The `fact_ratings` model is materialized incrementally to avoid rebuilding the entire ratings table on every dbt run.

## Materialization Strategy

| Layer | Materialization |
|--------|----------------|
| Staging | View |
| Intermediate | View |
| Dimensions | Table |
| Facts | Incremental |

## PostgreSQL Indexes

Indexes were added on:

- fact_ratings(movie_key)
- fact_ratings(user_key)
- fact_ratings(rating_timestamp)
- dim_movie(movie_id)
- dim_user(user_id)

These indexes improve join and aggregation performance for downstream analytics queries.