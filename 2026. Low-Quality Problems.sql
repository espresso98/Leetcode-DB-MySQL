-- Write an SQL query to report the IDs of the low-quality problems. A LeetCode problem is low-quality if the like percentage of the problem (number of likes divided by the total number of votes) is strictly less than 60%.
-- Return the result table ordered by problem_id in ascending order.

-- Solution1
WITH cte AS (
    SELECT problem_id, likes / (likes + dislikes) AS quality 
    FROM Problems
)
SELECT problem_id
FROM cte 
WHERE quality < 0.6
ORDER BY 1


-- Solution2
SELECT problem_id
FROM
(SELECT problem_id, likes / (likes + dislikes) as quality
FROM Problems) t
WHERE quality < 0.6
ORDER BY 1


/* Input: 
Problems table:
+------------+-------+----------+
| problem_id | likes | dislikes |
+------------+-------+----------+
| 6          | 1290  | 425      |
| 11         | 2677  | 8659     |
| 1          | 4446  | 2760     |
| 7          | 8569  | 6086     |
| 13         | 2050  | 4164     |
| 10         | 9002  | 7446     |
+------------+-------+----------+
Output: 
+------------+
| problem_id |
+------------+
| 7          |
| 10         |
| 11         |
| 13         |
+------------+ */