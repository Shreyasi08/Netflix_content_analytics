WITH movies AS (

    SELECT *
    FROM {{ ref('stg_movies') }}

),

genres AS (

    SELECT
        movie_id,
        UNNEST(STRING_TO_ARRAY(genres, '|')) AS genre
    FROM movies

)

SELECT
    movie_id,
    genre
FROM genres
WHERE genre <> '(no genres listed)'