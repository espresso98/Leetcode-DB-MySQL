SELECT user_id, SUM(quantity * price) as spending
FROM Sales s
LEFT JOIN Product p ON s.product_id = p.product_id
GROUP BY user_id
ORDER BY spending DESC
