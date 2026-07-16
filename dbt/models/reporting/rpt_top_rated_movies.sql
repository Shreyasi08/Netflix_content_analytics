SELECT

    title,

    average_rating,

    rating_count

FROM {{ ref('dim_movie') }}

WHERE rating_count >= 100

ORDER BY average_rating DESC