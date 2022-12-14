-- Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.

SELECT customer_id
FROM Customer
GROUP BY 1 
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product)
