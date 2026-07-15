WITH movie_genres AS (

    SELECT *
    FROM {{ ref('int_movie_genres') }}

),

genres AS (

    SELECT *
    FROM {{ ref('dim_genre') }}

)

SELECT

    movie_genres.movie_id,

    genres.genre_key

FROM movie_genres

JOIN genres

ON movie_genres.genre = genres.genre