WITH ratings AS (

    SELECT *
    FROM {{ ref('stg_ratings') }}

)

SELECT

    movie_id,

    COUNT(*) AS rating_count,

    ROUND(AVG(rating),2) AS average_rating,

    MIN(rating_timestamp) AS first_rating_date,

    MAX(rating_timestamp) AS last_rating_date

FROM ratings

GROUP BY movie_id