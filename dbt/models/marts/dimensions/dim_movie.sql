WITH movies AS (

    SELECT *
    FROM {{ ref('stg_movies') }}

),

stats AS (

    SELECT *
    FROM {{ ref('int_movie_statistics') }}

)

SELECT

    ROW_NUMBER() OVER (ORDER BY movies.movie_id) AS movie_key,

    movies.movie_id,

    movies.title,

    movies.genres,

    stats.rating_count,

    stats.average_rating,

    stats.first_rating_date,

    stats.last_rating_date

FROM movies

LEFT JOIN stats

ON movies.movie_id = stats.movie_id