-- Write an SQL query to report the device that is first logged in for each player.

--Solution1
SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
)

--Solution2
SELECT DISTINCT player_id, 
    FIRST_VALUE(device_id) OVER (PARTITION BY player_id ORDER BY event_date) AS device_id
FROM Activity