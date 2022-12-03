SELECT c.customer_id, customer_name
FROM Customers c
LEFT JOIN Orders o USING(customer_id)
GROUP BY 1
HAVING SUM(o.product_name='A') > 0 
    AND SUM(o.product_name='B') > 0
    AND SUM(o.product_name='C') = 0
