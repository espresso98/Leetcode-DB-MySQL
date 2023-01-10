-- The install date of a player is the first login day of that player.
-- We define day one retention of some date x to be the number of players whose install date is x and they logged back in on the day right after x, divided by the number of players whose install date is x, rounded to 2 decimal places.
-- Write an SQL query to report for each install date, the number of players that installed the game on that day, and the day one retention.
-- Write your MySQL query statement below
WITH first_logins AS (
    SELECT player_id, event_date, MIN(event_date) AS install_dt
    FROM Activity
    GROUP BY 1
), consecutive_logins AS (
    SELECT f.player_id, f.install_dt,
        CASE WHEN a.player_id IS NULL THEN 0 ELSE 1 END AS retained
    FROM first_logins f
    LEFT JOIN Activity a ON a.player_id = f.player_id AND DATEDIFF(a.event_date, f.install_dt) = 1 
                                                       -- f.install_dt = DATE_SUB(a.event_date, INTERVAL 1 DAY)
)
SELECT install_dt, COUNT(player_id) AS installs,
        ROUND(SUM(retained)/COUNT(player_id), 2) AS Day1_retention
FROM consecutive_logins
GROUP BY install_dt


-- SELECT * FROM consecutive_logins 
-- | player_id | install_dt | retained |
-- | --------- | ---------- | -------- |
-- | 1         | 2016-03-01 | 1        |
-- | 2         | 2017-06-25 | 0        |
-- | 3         | 2016-03-01 | 0        |

-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-01 | 0            |
-- | 3         | 4         | 2016-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +------------+----------+----------------+
-- | install_dt | installs | Day1_retention |
-- +------------+----------+----------------+
-- | 2016-03-01 | 2        | 0.50           |
-- | 2017-06-25 | 1        | 0.00           |
-- +------------+----------+----------------+
