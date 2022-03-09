-- Write an SQL query to report the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.

-- Solution1
SELECT employee_id 
FROM Employees
WHERE salary < 30000 
AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY 1


--Solution2
SELECT e.employee_id 
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.employee_id
WHERE e.salary < 30000 AND e.manager_id IS NOT NULL AND m.employee_id IS NULL 
ORDER BY 1


/* Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+ */ 