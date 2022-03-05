-- Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.


--Solution1
WITH new_table as (
SELECT product_id, store1 as price, 'store1' as store
FROM Products
UNION
SELECT product_id, store2 as price, 'store2' as store
FROM Products
UNION
SELECT product_id, store3 as price, 'store3' as store
FROM Products
)
SELECT product_id, store, price
FROM new_table
WHERE price IS NOT NULL
ORDER BY 1,2


--Solution2
SELECT product_id, 'store1' AS store, store1 AS price 
FROM Products 
WHERE store1 IS NOT NULL
UNION 
SELECT product_id, 'store2' AS store, store2 AS price 
FROM Products 
WHERE store2 IS NOT NULL
UNION 
SELECT product_id, 'store3' AS store, store3 AS price 
FROM Products WHERE store3 IS NOT NULL
ORDER BY 1,2



/* Input: 
Products table:
+------------+--------+--------+--------+
| product_id | store1 | store2 | store3 |
+------------+--------+--------+--------+
| 0          | 95     | 100    | 105    |
| 1          | 70     | null   | 80     |
+------------+--------+--------+--------+
Output: 
+------------+--------+-------+
| product_id | store  | price |
+------------+--------+-------+
| 0          | store1 | 95    |
| 0          | store2 | 100   |
| 0          | store3 | 105   |
| 1          | store1 | 70    |
| 1          | store3 | 80    |
+------------+--------+-------+ */ 