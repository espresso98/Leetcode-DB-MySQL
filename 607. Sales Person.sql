-- Write an SQL query to report the names of all the salespersons
-- who did not have any orders related to the company with the name "RED".
SELECT name
FROM SalesPerson 
WHERE sales_id NOT IN (
    SELECT sales_id 
    FROM Orders o
    LEFT JOIN Company c
        ON o.com_id = c.com_id
    WHERE c.name = 'RED'
    