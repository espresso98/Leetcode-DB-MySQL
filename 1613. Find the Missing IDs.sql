-- Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.
WITH RECURSIVE cte AS (
    SELECT 1 as ids
    UNION
    SELECT ids + 1
    FROM cte
    WHERE ids < (SELECT MAX(customer_id) FROM Customers)
)
SELECT ids
FROM cte
WHERE ids NOT IN (SELECT customer_id FROM Customers) 
ORDER BY ids
