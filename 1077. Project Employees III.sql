-- Write an SQL query that reports the most experienced employees in each project. In case of a tie, report all employees with the maximum number of experience years.
-- Solution1
SELECT project_id, employee_id 
FROM Project 
JOIN Employee 
USING (employee_id)
WHERE (project_id, experience_years) IN (
    SELECT project_id, MAX(experience_years) 
    FROM Project
    JOIN Employee USING (employee_id)
    GROUP BY project_id
    )

-- Solution2
WITH experience_years_rank AS (
    SELECT p.project_id, p.employee_id, 
        RANK() OVER (PARTITION BY p.project_id ORDER BY experience_years DESC) AS rnk
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
) 
SELECT project_id, employee_id
FROM experience_years_rank
WHERE rnk = 1
