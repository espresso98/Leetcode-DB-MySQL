-- Write an SQL query to report all the employees with their primary department. For employees who belong to one department, report their only department.


--Solution1
SELECT employee_id, department_id 
FROM (SELECT *, COUNT(department_id) OVER(PARTITION BY employee_id) AS dep_cnt
      FROM Employee) t
WHERE dep_cnt=1 OR primary_flag='Y'
ORDER BY 1


--Solution2
SELECT employee_id, department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY 1
    HAVING COUNT(department_id) = 1
) OR primary_flag = 'Y'
ORDER BY 1


--Solution3 
SELECT employee_id, department_id 
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id 
FROM Employee 
GROUP BY employee_id
HAVING COUNT(department_id) = 1


/* Input: 
Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+
Output: 
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+ */
