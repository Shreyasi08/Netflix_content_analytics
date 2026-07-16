-- =====================================================
-- Query 1: Highest Rated Movies
-- =====================================================

EXPLAIN ANALYZE

SELECT
    m.title,
    AVG(f.rating) AS avg_rating,
    COUNT(*) AS total_ratings
FROM analytics.fact_ratings f
JOIN analytics.dim_movie m
    ON f.movie_key = m.movie_key
GROUP BY m.title
HAVING COUNT(*) > 100
ORDER BY avg_rating DESC
LIMIT 20;



-- =====================================================
-- Query 2: Most Active Users
-- =====================================================

EXPLAIN ANALYZE

SELECT
    u.user_id,
    COUNT(*) AS ratings_given
FROM analytics.fact_ratings f
JOIN analytics.dim_user u
    ON f.user_key = u.user_key
GROUP BY u.user_id
ORDER BY ratings_given DESC
LIMIT 20;



-- =====================================================
-- Query 3: Ratings by Year
-- =====================================================

EXPLAIN ANALYZE

SELECT
    EXTRACT(YEAR FROM rating_timestamp) AS year,
    COUNT(*) AS ratings
FROM analytics.fact_ratings
GROUP BY year
ORDER BY year;