SELECT
    tagid AS tag_id,
    tag
FROM {{ source('raw', 'raw_genome_tags') }}