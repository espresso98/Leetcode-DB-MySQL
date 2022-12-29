-- Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N-1;
  RETURN (
      IFNULL((SELECT DISTINCT Salary 
              FROM Employee
              ORDER BY 1 DESC
              LIMIT 1 OFFSET N), NULL)
  );
END


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH salary_rank AS (
        SELECT id, salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM Employee
      )
      SELECT DISTINCT salary
      FROM salary_rank
      WHERE rnk = N
  );
END

/* Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+ */ 