-- Write an SQL query to find the price of each product in each store.

SELECT  product_id, 
        MAX(CASE WHEN store = 'store1' THEN price END) AS store1,
        MAX(CASE WHEN store = 'store2' THEN price END) AS store2,
        MAX(CASE WHEN store = 'store3' THEN price END) AS store3
FROM Products
GROUP BY 1
ORDER BY 1
      


/* Input: 
Products table:
+-------------+--------+-------+
| product_id  | store  | price |
+-------------+--------+-------+
| 0           | store1 | 95    |
| 0           | store3 | 105   |
| 0           | store2 | 100   |
| 1           | store1 | 70    |
| 1           | store3 | 80    |
+-------------+--------+-------+
Output: 
+-------------+--------+--------+--------+
| product_id  | store1 | store2 | store3 |
+-------------+--------+--------+--------+
| 0           | 95     | 100    | 105    |
| 1           | 70     | null   | 80     |
+-------------+--------+--------+--------+  */      


-- After group by the product_id, you need to use aggregate function to obtain the price for each store.
-- You can use max(), min(), sum() or avg(), but not count().
-- Otherwise, it will just return the first row of the group by result, e.g. [0, 95, NULL, NULL]
