WITH genres AS (

    SELECT DISTINCT
        genre
    FROM {{ ref('int_movie_genres') }}

)

SELECT

    ROW_NUMBER() OVER (ORDER BY genre) AS genre_key,

    genre

FROM genres