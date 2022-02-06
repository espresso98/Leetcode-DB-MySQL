-- Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

--Solution1
SELECT ROUND(SUM(order_date = customer_pref_delivery_date) / COUNT(*) * 100, 2)  AS immediate_percentage 
FROM Delivery

--Solution2
SELECT ROUND(
        (SELECT COUNT(*) FROM Delivery WHERE order_date = customer_pref_delivery_date)
        / (SELECT COUNT(*) FROM Delivery) * 100, 2)   
AS immediate_percentage 