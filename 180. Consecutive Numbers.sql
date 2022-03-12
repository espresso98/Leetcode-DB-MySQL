-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- Solution1
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num, 
           LAG(num,1) OVER (ORDER BY id) AS prev, 
           LEAD(num,1) OVER(ORDER BY id) AS next
    FROM Logs
) t
WHERE num = prev AND num = next
    

-- Solution2
WITH is_consecutive AS (
    SELECT num, 
           LAG(num,1) OVER (ORDER BY id) AS prev, 
           LEAD(num,1) OVER(ORDER BY id) AS next
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM is_consecutive
WHERE num = prev AND num = next


/* Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+ */ 