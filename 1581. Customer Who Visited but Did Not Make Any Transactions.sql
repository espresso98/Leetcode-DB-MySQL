-- Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.


SELECT customer_id, COUNT(visit_id) AS count_no_trans 
FROM Visits v
LEFT JOIN Transactions USING(visit_id)
WHERE v.visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id
ORDER BY 2


/* Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+ */ 