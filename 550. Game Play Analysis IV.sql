-- Write an SQL query to report the fraction of players that logged in again on the day 
-- after the day they first logged in, rounded to 2 decimal places. 

-- Soluton 1
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY 1
)
SELECT ROUND(COUNT(a.player_id) / COUNT(f.player_id), 2) AS fraction 
FROM first_logins f
LEFT JOIN Activity a
ON a.player_id = f.player_id AND a.event_date = f.first_login + 1  -- DATEDIFF(a.event_date, f.first_login) = 1

-- Soliution 2
SELECT ROUND(COUNT(player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity), 2) as fraction
FROM activity
WHERE (player_id, event_date) IN
   (SELECT player_id, DATE(MIN(event_date) + 1)
    FROM activity
    GROUP BY 1)
