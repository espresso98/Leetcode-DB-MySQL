--  Write an SQL query to find the rows that contain the median salary of each company. While calculating the median, when you sort the salaries of the company, break the ties by id.
WITH salary_rank AS (
    SELECT id, company, salary, 
        ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS rn,
        COUNT(id) OVER(PARTITION BY company) AS N
    FROM Employee
)
SELECT id, company, salary
FROM salary_rank
WHERE rn BETWEEN N/2 and N/2 + 1
