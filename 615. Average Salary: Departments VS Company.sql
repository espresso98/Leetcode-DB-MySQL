-- Write an SQL query to report the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.
WITH company_avg_salary AS (
    SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, AVG(amount) AS comp_avg_sal
    FROM Salary
    GROUP BY pay_month
), department_avg_salaray AS (
    SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, department_id, AVG(amount) AS dept_avg_sal
    FROM Salary s JOIN Employee e USING(employee_id) 
    GROUP BY department_id, pay_month
)
SELECT pay_month, department_id, 
    (CASE WHEN dept_avg_sal > comp_avg_sal THEN 'higher'
          WHEN dept_avg_sal < comp_avg_sal THEN 'lower'
          ELSE 'same'
    END) AS comparison
FROM department_avg_salaray
JOIN company_avg_salary USING(pay_month)


-- SELECT * FROM company_avg_salary ORDER BY 1
-- | pay_month | comp_avg_sal |
-- | --------- | ------------ |
-- | 2017-02   | 7000         |
-- | 2017-03   | 8333.3333    |

-- SELECT * FROM department_avg_salaray ORDER BY 2, 1
-- | pay_month | department_id | dept_avg_sal |
-- | --------- | ------------- | ------------ |
-- | 2017-02   | 1             | 7000         |
-- | 2017-03   | 1             | 9000         |
-- | 2017-02   | 2             | 7000         |
-- | 2017-03   | 2             | 8000         |


-- Input: 
-- Salary table:
-- +----+-------------+--------+------------+
-- | id | employee_id | amount | pay_date   |
-- +----+-------------+--------+------------+
-- | 1  | 1           | 9000   | 2017/03/31 |
-- | 2  | 2           | 6000   | 2017/03/31 |
-- | 3  | 3           | 10000  | 2017/03/31 |
-- | 4  | 1           | 7000   | 2017/02/28 |
-- | 5  | 2           | 6000   | 2017/02/28 |
-- | 6  | 3           | 8000   | 2017/02/28 |
-- +----+-------------+--------+------------+
-- Employee table:
-- +-------------+---------------+
-- | employee_id | department_id |
-- +-------------+---------------+
-- | 1           | 1             |
-- | 2           | 2             |
-- | 3           | 2             |
-- +-------------+---------------+
-- Output: 
-- +-----------+---------------+------------+
-- | pay_month | department_id | comparison |
-- +-----------+---------------+------------+
-- | 2017-02   | 1             | same       |
-- | 2017-03   | 1             | higher     |
-- | 2017-02   | 2             | same       |
-- | 2017-03   | 2             | lower      |
-- +-----------+---------------+------------+
