-- Write an SQL query that reports the products that were only sold in the spring of 2019.

--Solution1
SELECT s.product_id, product_name
FROM Sales s
JOIN Product p
    ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING MIN(sale_date) >='2019-01-01' AND
       MAX(sale_date) <= '2019-03-31'

--Solution2
SELECT product_id, product_name
FROM product
WHERE product_id NOT IN (
    SELECT product_id 
    FROM sales 
    WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31')