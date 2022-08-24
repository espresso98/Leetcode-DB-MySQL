-- Write an SQL query to find the employees who are high earners in each of the departments.
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

-- Solution1
WITH salary_rank AS (
    SELECT departmentId, name, salary, 
     DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS ranking
    FROM Employee
)
SELECT d.name as Department, e.name as Employee, salary as Salary
FROM salary_rank e 
JOIN Department d ON e.departmentId = d.id
WHERE ranking <= 3


-- Solution2 
SELECT Department, employee, salary 
FROM (
    SELECT d.name AS Department
         , e.name AS employee
         , e.salary
         , DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS drank
    FROM Employee e JOIN Department d ON e.DepartmentId= d.Id
) t WHERE t.drank <= 3


/* Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
*/