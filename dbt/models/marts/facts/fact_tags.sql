WITH tags AS (

    SELECT *
    FROM {{ ref('stg_tags') }}

)

SELECT *

FROM tags