SELECT
    userid AS user_id,
    movieid AS movie_id,
    rating,
    TO_TIMESTAMP(timestamp) AS rating_timestamp
FROM {{ source('raw', 'raw_ratings') }}