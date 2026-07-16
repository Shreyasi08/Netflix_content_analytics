-- =====================================================
-- Performance Indexes
-- =====================================================

-- Fact Ratings
CREATE INDEX IF NOT EXISTS idx_fact_ratings_movie_key
ON analytics.fact_ratings(movie_key);

CREATE INDEX IF NOT EXISTS idx_fact_ratings_user_key
ON analytics.fact_ratings(user_key);

CREATE INDEX IF NOT EXISTS idx_fact_ratings_timestamp
ON analytics.fact_ratings(rating_timestamp);

-- Movie Dimension
CREATE INDEX IF NOT EXISTS idx_dim_movie_movie_id
ON analytics.dim_movie(movie_id);

-- User Dimension
CREATE INDEX IF NOT EXISTS idx_dim_user_user_id
ON analytics.dim_user(user_id);