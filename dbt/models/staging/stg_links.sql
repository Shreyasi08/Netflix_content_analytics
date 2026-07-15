SELECT
    movieid AS movie_id,
    imdbid AS imdb_id,
    tmdbid AS tmdb_id
FROM {{ source('raw', 'raw_links') }}