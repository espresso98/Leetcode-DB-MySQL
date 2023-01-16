-- Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.
-- Return the result table ordered by visit_date in ascending order.
-- Solution1
WITH consecutive_days AS (
    SELECT id, visit_date, people, 
        LEAD(id, 1) OVER(ORDER BY id) AS next1,
        LEAD(id, 2) OVER(ORDER BY id) AS next2,
        LAG(id, 1)  OVER(ORDER BY id) AS prev1,
        LAG(id, 2)  OVER(ORDER BY id) AS prev2
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM consecutive_days
WHERE (id + 1 = next1 AND id + 2 = next2)
   OR (id - 1 = prev1 AND id + 1 = next1)
   OR (id - 2 = prev2 AND id - 1 = prev1)
ORDER BY visit_date

-- Solution2 
WITH cte AS (
    SELECT id, visit_date, people, id - ROW_NUMBER() OVER (ORDER BY id) AS grp  
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM cte
WHERE grp in (SELECT grp FROM cte  GROUP BY grp HAVING COUNT(1) >= 3)

-- SELECT * FROM cte
-- | id | rn | grp |
-- | -- | -- | --- |
-- | 2  | 1  | 1   |
-- | 3  | 2  | 1   |
-- | 5  | 3  | 2   |
-- | 6  | 4  | 2   |
-- | 7  | 5  | 2   |
-- | 8  | 6  | 2   |
