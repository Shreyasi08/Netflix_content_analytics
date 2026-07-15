WITH scores AS (

    SELECT *
    FROM {{ ref('stg_genome_scores') }}

)

SELECT *

FROM scores