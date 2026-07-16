SELECT

    EXTRACT(YEAR FROM rating_timestamp) AS rating_year,

    COUNT(*) AS total_ratings,

    AVG(rating) AS average_rating

FROM {{ ref('fact_ratings') }}

GROUP BY 1

ORDER BY 1