-- # Write an SQL query to get the names of products that have at least 100 units ordered in February 2020 and their amount.

SELECT product_name, SUM(unit) AS unit
FROM Products p
JOIN Orders o USING(product_id)
WHERE Left(order_date, 7) = '2020-02'
GROUP BY o.product_id
HAVING SUM(unit) >= 100
