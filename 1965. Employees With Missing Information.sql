-- Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:
-- The employee's name is missing, or
-- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

--Solution1
SELECT employee_id FROM Employees 
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION 
SELECT employee_id FROM Salaries 
WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY 1


--Solution2
SELECT e.employee_id FROM employees e
LEFT JOIN salaries s ON e.employee_id = s.employee_id
where s.salary is null
UNION
SELECT s.employee_id FROM employees e
RIGHT JOIN salaries s ON e.employee_id = s.employee_id
where e.name is null
order by employee_id


-- The RIGHT JOIN keyword returns all records from the right table (table2), 
-- and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.

/* Input: 
Employees table:
+-------------+----------+
| employee_id | name     |
+-------------+----------+
| 2           | Crew     |
| 4           | Haven    |
| 5           | Kristian |
+-------------+----------+
Salaries table:
+-------------+--------+
| employee_id | salary |
+-------------+--------+
| 5           | 76071  |
| 1           | 22517  |
| 4           | 63539  |
+-------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 1           |
| 2           |
+-------------+ */ 
