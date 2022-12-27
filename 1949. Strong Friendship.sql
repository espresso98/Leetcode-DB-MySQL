-- A friendship between a pair of friends x and y is strong if x and y have at least three common friends.
WITH all_friends AS (
    SELECT user1_id AS user, user2_id AS friend FROM Friendship 
    UNION
    SELECT user2_id AS user, user1_id AS friend FROM Friendship 
)
SELECT a.user AS user1_id, b.user AS user2_id, COUNT(*) AS common_friend
FROM all_friends a
JOIN all_friends b
ON a.user < b.user AND a.friend = b.friend 
    AND (a.user, b.user) IN (SELECT user, friend FROM all_friends) -- They should be a friend
GROUP BY 1, 2
HAVING COUNT(*) >= 3
