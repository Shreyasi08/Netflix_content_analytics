SELECT

    dm.movie_key,
    dm.movie_id,
    dm.title,
    dm.genres,

    dm.rating_count,

    dm.average_rating,

    RANK() OVER (
        ORDER BY dm.rating_count DESC
    ) AS popularity_rank

FROM {{ ref('dim_movie') }} dm