SELECT

    user_id,

    ratings_count,

    average_rating_given,

    first_rating,

    last_rating

FROM {{ ref('dim_user') }}