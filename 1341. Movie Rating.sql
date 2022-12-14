-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

WITH rating_cnt AS (
    SELECT name, COUNT(rating) AS rating_cnt 
    FROM MovieRating 
    JOIN Users USING(user_id)
    GROUP BY user_id
    ORDER BY 2 DESC, 1
    LIMIT 1
), 
rating_avg AS (
    SELECT title, AVG(rating) AS rating_avg
    FROM MovieRating r
    JOIN Movies m USING(movie_id)
    WHERE LEFT(created_at, 7) = '2020-02'
    GROUP BY m.movie_id
    ORDER BY 2 DESC, 1
    LIMIT 1
)
SELECT name AS results FROM rating_cnt
UNION
SELECT title AS results FROM rating_avg 
