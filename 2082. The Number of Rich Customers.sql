-- Write an SQL query to report the number of customers who had  one bill with an amount strictly greater than 500.

SELECT COUNT(DISTINCT customer_id) AS rich_count
FROM Store
WHERE amount > 500


/* Input: 
Store table:
+---------+-------------+--------+
| bill_id | customer_id | amount |
+---------+-------------+--------+
| 6       | 1           | 549    |
| 8       | 1           | 834    |
| 4       | 2           | 394    |
| 11      | 3           | 657    |
| 13      | 3           | 257    |
+---------+-------------+--------+
Output: 
+------------+
| rich_count |
+------------+
| 2          |
+------------+ */ 