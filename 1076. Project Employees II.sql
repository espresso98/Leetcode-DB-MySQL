-- Write an SQL query that reports all the projects that have the most employees.

--Solution1
WITH CTE AS (
    SELECT project_id, 
           DENSE_RANK() OVER(ORDER BY COUNT(employee_id) DESC) AS ranking
    FROM Project 
    GROUP BY project_id
)
             
SELECT project_id
FROM CTE
WHERE ranking = 1

--Solution2
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (
            SELECT COUNT(employee_id) AS cnt
            FROM Project
            GROUP BY project_id
            ORDER BY cnt DESC
            LIMIT 1
            )