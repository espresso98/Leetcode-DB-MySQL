-- Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.

SELECT product_name, year, price
FROM Sales 
LEFT JOIN Product
USING (product_id)