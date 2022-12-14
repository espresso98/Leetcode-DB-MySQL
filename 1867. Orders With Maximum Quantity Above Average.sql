-- You are running an e-commerce site that is looking for imbalanced orders. An imbalanced order is one whose maximum quantity is strictly greater than the average quantity of every order (including itself).
-- The average quantity of an order is calculated as (total quantity of all products in the order) / (number of different products in the order). The maximum quantity of an order is the highest quantity of any single product in the order.
-- Write an SQL query to find the order_id of all imbalanced orders.

WITH quantity AS (
    SELECT 
        order_id, 
        AVG(quantity) AS avg_quantity,
        MAX(quantity) AS max_quantity
    FROM OrdersDetails
    GROUP BY order_id
)
SELECT order_id
FROM quantity
WHERE max_quantity > (SELECT MAX(avg_quantity) FROM quantity)
