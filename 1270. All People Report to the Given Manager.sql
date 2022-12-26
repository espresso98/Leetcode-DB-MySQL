-- Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.
-- The head of the company is the employee with employee_id = 1.
-- The indirect relation between managers will not exceed three managers as the company is small.

SELECT a.employee_id
FROM Employees a
JOIN Employees b ON a.manager_id = b.employee_id
JOIN Employees c ON b.manager_id = c.employee_id
WHERE a.employee_id <> 1 AND (a.manager_id = 1 or b.manager_id = 1 or c.manager_id = 1)
