SELECT

    dg.genre,

    COUNT(DISTINCT dm.movie_id) AS total_movies,

    AVG(dm.average_rating) AS average_movie_rating,

    SUM(dm.rating_count) AS total_ratings

FROM {{ ref('bridge_movie_genre') }} bg

JOIN {{ ref('dim_movie') }} dm
    ON bg.movie_id = dm.movie_id

JOIN {{ ref('dim_genre') }} dg
    ON bg.genre_key = dg.genre_key

GROUP BY dg.genre

ORDER BY total_ratings DESC