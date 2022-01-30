-- Write an SQL query that reports the buyers who have bought S8 but not iPhone.

SELECT buyer_id
FROM Product p
JOIN Sales s
ON s.product_id = p.product_id 
GROUP BY buyer_id 
HAVING SUM(product_name = 'S8') > 0 and SUM(product_name = 'iPhone') = 0;