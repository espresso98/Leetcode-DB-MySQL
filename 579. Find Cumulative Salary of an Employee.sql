-- Solution1
SELECT e.id, e.month, SUM(e2.Salary) as Salary
FROM Employee e
JOIN Employee e2 ON e.id = e2.id AND e.month >= e2.month AND (e.month - e2.month <= 2)
WHERE e.Month < (SELECT MAX(month) from Employee where id = e.id)
GROUP BY e.id, e.month
ORDER BY e.id, e.month DESC


-- Solution2
WITH cte AS (
    SELECT id, month, 
        RANK() OVER (PARTITION BY id ORDER BY month DESC) AS month_recent_rank, salary, 
        SUM(salary) OVER (PARTITION BY id ORDER BY month RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) AS salary_sum
    FROM Employee
)
SELECT id, month, salary_sum AS Salary
FROM cte
WHERE month_recent_rank > 1
ORDER BY id ASC, month DESC

-- SELECT * FROM cte
-- | id | month | month_recent_rank | salary | salary_sum |
-- | -- | ----- | ----------------- | ------ | ---------- |
-- | 1  | 1     | 6                 | 20     | 20         |
-- | 1  | 2     | 5                 | 30     | 50         |
-- | 1  | 3     | 4                 | 40     | 90         |
-- | 1  | 4     | 3                 | 60     | 130        |
-- | 1  | 7     | 2                 | 90     | 90         |
-- | 1  | 8     | 1                 | 90     | 180        |
-- | 2  | 1     | 2                 | 20     | 20         |
-- | 2  | 2     | 1                 | 30     | 50         |
-- | 3  | 2     | 3                 | 40     | 40         |
-- | 3  | 3     | 2                 | 60     | 100        |
-- | 3  | 4     | 1                 | 70     | 170        |

-- Expected
-- | id | month | Salary |
-- | -- | ----- | ------ |
-- | 1  | 7     | 90     |
-- | 1  | 4     | 130    |
-- | 1  | 3     | 90     |
-- | 1  | 2     | 50     |
-- | 1  | 1     | 20     |
-- | 2  | 1     | 20     |
-- | 3  | 3     | 100    |
-- | 3  | 2     | 40     |