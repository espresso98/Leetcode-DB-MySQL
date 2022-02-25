-- Write an SQL query to report product_name in lowercase without leading or trailing white spaces.
-- sale_date in the format ('YYYY-MM').
-- total the number of times the product was sold in this month.
-- Return the result table ordered by product_name in ascending order. In case of a tie, order it by sale_date in ascending order.


SELECT LOWER(TRIM(product_name)) AS product_name, 
       LEFT(sale_date, 7) AS sale_date,  -- or DATE_FORMAT(sale_date, '%Y-%m')
       COUNT(sale_id) AS total
FROM Sales
GROUP BY 1, 2
ORDER BY 1, 2



/* Sales table:
+---------+--------------+------------+
| sale_id | product_name | sale_date  |
+---------+--------------+------------+
| 1       | LCPHONE      | 2000-01-16 |
| 2       | LCPhone      | 2000-01-17 |
| 3       | LcPhOnE      | 2000-02-18 |
| 4       | LCKeyCHAiN   | 2000-02-19 |
| 5       | LCKeyChain   | 2000-02-28 |
| 6       | Matryoshka   | 2000-03-31 |
+---------+--------------+------------+
Output: 
+--------------+-----------+-------+
| product_name | sale_date | total |
+--------------+-----------+-------+
| lckeychain   | 2000-02   | 2     |
| lcphone      | 2000-01   | 2     |
| lcphone      | 2000-02   | 1     |
| matryoshka   | 2000-03   | 1     |
+--------------+-----------+-------+  */