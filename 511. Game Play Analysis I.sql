-- Write an SQL query to report the first login date for each player.

--Solution1
SELECT player_id, MIN(event_date) AS first_login 
FROM Activity
GROUP BY player_id

--Solution2
SELECT DISTINCT player_id, 
       FIRST_VALUE(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS first_login 
FROM Activity

