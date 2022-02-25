-- Write an SQL query to find the number of unique orders and the number of unique customers with invoices > $20 for each different month.


--Solution1
SELECT LEFT(order_date, 7) AS month, 
       COUNT(order_id) AS order_count,  
       COUNT(DISTINCT(customer_id)) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY 1


--Solution2
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
       COUNT(order_id) AS order_count,  
       COUNT(DISTINCT(customer_id)) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY 1



/* Input: 
Orders table:
+----------+------------+-------------+------------+
| order_id | order_date | customer_id | invoice    |
+----------+------------+-------------+------------+
| 1        | 2020-09-15 | 1           | 30         |
| 2        | 2020-09-17 | 2           | 90         |
| 3        | 2020-10-06 | 3           | 20         |
| 4        | 2020-10-20 | 3           | 21         |
| 5        | 2020-11-10 | 1           | 10         |
| 6        | 2020-11-21 | 2           | 15         |
| 7        | 2020-12-01 | 4           | 55         |
| 8        | 2020-12-03 | 4           | 77         |
| 9        | 2021-01-07 | 3           | 31         |
| 10       | 2021-01-15 | 2           | 20         |
+----------+------------+-------------+------------+
Output: 
+---------+-------------+----------------+
| month   | order_count | customer_count |
+---------+-------------+----------------+
| 2020-09 | 2           | 2              |
| 2020-10 | 1           | 1              |
| 2020-12 | 2           | 1              |
| 2021-01 | 1           | 1              |
+---------+-------------+----------------+ */ 