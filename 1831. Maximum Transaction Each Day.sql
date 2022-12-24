-- Write an SQL query to report the IDs of the transactions with the maximum amount on their respective day. If in one day there are multiple such transactions, return all of them.
WITH cte AS (
    SELECT transaction_id, 
    RANK() OVER (PARTITION BY DATE(day) ORDER BY amount DESC) AS rnk
    FROM Transactions 
)
SELECT transaction_id
FROM cte  
WHERE rnk = 1
ORDER BY 1
