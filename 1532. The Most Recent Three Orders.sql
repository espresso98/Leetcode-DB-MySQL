-- Write an SQL query to find the most recent three orders of each user. If a user ordered less than three orders, return all of their orders. 
-- Each customer has one order per day.
WITH recent_orders AS (
    SELECT customer_id, order_id, order_date,
        RANK() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
    FROM Orders
    ORDER BY 1, 4, 2 
)
SELECT name AS customer_name, o.customer_id, order_id, order_date
FROM recent_orders o
JOIN Customers c
USING(customer_id)
WHERE rnk <= 3
ORDER BY 1, 2, 4 DESC
