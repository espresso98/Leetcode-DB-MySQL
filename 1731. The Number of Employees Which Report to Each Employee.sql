-- Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.


SELECT e1.employee_id, e1.name, 
       COUNT(e2.employee_id) AS reports_count, 
       ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2 ON e1.employee_id = e2.reports_to
GROUP BY 1
ORDER BY 1


/* Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+ */ 