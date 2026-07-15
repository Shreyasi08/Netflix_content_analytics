WITH ratings AS (

    SELECT *
    FROM {{ ref('stg_ratings') }}

)

SELECT

    user_id,

    COUNT(*) AS ratings_count,

    ROUND(AVG(rating),2) AS average_rating_given,

    MIN(rating_timestamp) AS first_rating,

    MAX(rating_timestamp) AS last_rating

FROM ratings

GROUP BY user_id