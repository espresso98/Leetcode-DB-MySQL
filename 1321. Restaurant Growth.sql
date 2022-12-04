-- Write an SQL query to compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
-- Return result table ordered by visited_on in ascending order.

-- Solution1
WITH cte AS (
    SELECT visited_on, 
           SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS 7days_sum,
           DENSE_RANK() OVER(ORDER BY visited_on) AS rn
    FROM Customer
    ORDER BY 1
)
SELECT DISTINCT visited_on, 7days_sum as amount, ROUND(7days_sum/7, 2) AS average_amount
FROM cte
WHERE rn >= 7

-- Solution2 
SELECT a.visited_on, SUM(b.amount) AS amount, ROUND(SUM(b.amount)/7, 2) AS average_amount
FROM (SELECT DISTINCT visited_on FROM Customer) a
JOIN Customer b
ON DATEDIFF(a.visited_on, b.visited_on) BETWEEN 0 AND 6
GROUP BY a.visited_on
HAVING COUNT(DISTINCT(b.visited_on)) > 6
