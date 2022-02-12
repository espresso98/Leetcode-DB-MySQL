-- Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.

SELECT u.product_id, ROUND(SUM(p.price * u.units)/SUM(u.units), 2) average_price
FROM Prices p
JOIN UnitsSold u
    ON p.product_id = u.product_id AND 
       (u.purchase_date BETWEEN start_date AND end_date)
GROUP BY p.product_id