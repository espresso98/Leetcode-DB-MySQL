WITH row_num AS (
    SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id) AS rn
    FROM Logs
)
SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id 
FROM row_num
GROUP BY log_id - rn
