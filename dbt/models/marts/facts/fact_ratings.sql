{{ config(
    materialized='incremental',
    unique_key=['user_id','movie_id','rating_timestamp']
) }}

WITH ratings AS (

    SELECT *
    FROM {{ ref('stg_ratings') }}

    {% if is_incremental() %}

        WHERE rating_timestamp >
        (
            SELECT MAX(rating_timestamp)
            FROM {{ this }}
        )

    {% endif %}

),

movies AS (

    SELECT
        movie_id,
        movie_key
    FROM {{ ref('dim_movie') }}

),

users AS (

    SELECT
        user_id,
        user_key
    FROM {{ ref('dim_user') }}

)

SELECT

    ratings.user_id,

    users.user_key,

    ratings.movie_id,

    movies.movie_key,

    ratings.rating,

    ratings.rating_timestamp

FROM ratings

LEFT JOIN movies
ON ratings.movie_id = movies.movie_id

LEFT JOIN users
ON ratings.user_id = users.user_id