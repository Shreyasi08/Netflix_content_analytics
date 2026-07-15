SELECT
    movieid AS movie_id,
    tagid AS tag_id,
    relevance
FROM {{ source('raw', 'raw_genome_scores') }}