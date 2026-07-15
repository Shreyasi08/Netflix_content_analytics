WITH users AS (

    SELECT *
    FROM {{ ref('int_user_statistics') }}

)

SELECT

    ROW_NUMBER() OVER (ORDER BY user_id) AS user_key,

    *

FROM users