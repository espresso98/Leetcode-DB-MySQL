-- Write an SQL query to find the most recent order(s) of each product.
-- Return the result table ordered by product_name in ascending order and in case of a tie by the product_id in ascending order. If there still a tie, order them by order_id in ascending order

SELECT product_name, product_id, order_id, order_date
FROM Orders o
LEFT JOIN Products p
USING(product_id)
WHERE (o.product_id, o.order_date) 
IN (SELECT product_id, max(order_date) AS order_date FROM Orders GROUP BY 1)
ORDER BY 1, 2, 3
