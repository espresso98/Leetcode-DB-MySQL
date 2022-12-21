-- Write an SQL query to find all the pairs of users with the maximum number of common followers. In other words, if the maximum number of common followers between any two users is maxCommon, then you have to return all pairs of users that have maxCommon common followers.
WITH cte AS (
    SELECT r1.user_id AS user1_id, r2.user_id AS user2_id, count(*) AS cnt
    FROM Relations r1
    JOIN Relations r2 ON r1.follower_id = r2.follower_id AND r1.user_id < r2.user_id
    GROUP BY 1, 2
)
SELECT user1_id, user2_id
FROM cte
WHERE cnt = (SELECT MAX(cnt) FROM cte)
