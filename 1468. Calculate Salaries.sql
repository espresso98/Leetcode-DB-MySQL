-- Solution1
SELECT company_id, employee_id, employee_name,
    (CASE WHEN MAX(salary) OVER (PARTITION BY company_id) < 1000 THEN salary
          WHEN MAX(salary) OVER (PARTITION BY company_id) BETWEEN 1000 AND 10000 THEN ROUND(salary * (1-0.24))
          ELSE ROUND(salary * (1-0.49))
    END) AS salary
FROM Salaries
  

-- Solution2
SELECT company_id, employee_id, employee_name, 
    (CASE WHEN max_salary < 1000 THEN salary
         WHEN max_salary > 10000 THEN ROUND(salary * (1-0.49))
         ELSE ROUND(salary * (1-0.24)) END) AS salary
FROM (SELECT *, MAX(salary) OVER (PARTITION BY company_id) AS max_salary FROM Salaries) sub
