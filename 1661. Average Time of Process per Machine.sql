-- Write an SQL query to find the average time each machine takes to complete a process.

--Solution1
SELECT s.machine_id, 
       ROUND(AVG(e.timestamp-s.timestamp), 3) processing_time
FROM Activity s
JOIN Activity e
ON s.machine_id = e.machine_id AND 
   s.process_id = e.process_id AND 
   s.activity_type ='start' AND e.activity_type = 'end'
GROUP BY 1


--Solution2
SELECT machine_id, 
       ROUND((SUM(CASE WHEN activity_type = 'end' THEN timestamp END)
             -SUM(CASE WHEN activity_type = 'start' THEN timestamp END))
             /COUNT(DISTINCT process_id), 3) processing_time
FROM Activity
GROUP BY 1



/* Input: 
Activity table:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+
Output: 
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+ */ 