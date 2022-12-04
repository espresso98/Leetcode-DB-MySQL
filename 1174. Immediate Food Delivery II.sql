-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 
                      ELSE 0 END)* 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY 1)
