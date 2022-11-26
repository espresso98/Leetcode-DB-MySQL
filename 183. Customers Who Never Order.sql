-- Solution 1
SELECT name Customers
FROM Customers
WHERE id NOT IN (
    SELECT CustomerId
    FROM Orders)
    
-- Solution 2
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL
