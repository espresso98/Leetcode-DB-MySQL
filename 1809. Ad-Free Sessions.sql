-- Write an SQL query to report all the sessions that did not get shown any ads.

--Solution1
SELECT p.session_id
FROM Playback p
LEFT JOIN Ads a
ON p.customer_id = a.customer_id 
AND timestamp BETWEEN start_time AND end_time 
WHERE a.customer_id IS NULL 


--Solution2
SELECT session_id
FROM Playback 
WHERE session_id NOT IN (
    SELECT session_id
    FROM Playback p
    JOIN Ads a
    ON p.customer_id = a.customer_id 
    AND timestamp BETWEEN start_time AND end_time 
)


/* Input: 
Playback table:
+------------+-------------+------------+----------+
| session_id | customer_id | start_time | end_time |
+------------+-------------+------------+----------+
| 1          | 1           | 1          | 5        |
| 2          | 1           | 15         | 23       |
| 3          | 2           | 10         | 12       |
| 4          | 2           | 17         | 28       |
| 5          | 2           | 2          | 8        |
+------------+-------------+------------+----------+
Ads table:
+-------+-------------+-----------+
| ad_id | customer_id | timestamp |
+-------+-------------+-----------+
| 1     | 1           | 5         |
| 2     | 2           | 17        |
| 3     | 2           | 20        |
+-------+-------------+-----------+
Output: 
+------------+
| session_id |
+------------+
| 2          |
| 3          |
| 5          |
+------------+ */
