SELECT
    userid AS user_id,
    movieid AS movie_id,
    tag,
    TO_TIMESTAMP(timestamp) AS tag_timestamp
FROM {{ source('raw', 'raw_tags') }}