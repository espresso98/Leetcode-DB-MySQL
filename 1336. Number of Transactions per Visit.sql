-- Write an SQL query to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction and so on.
-- transactions_count should take all values from 0 to max(transactions_count) done by one or more users.

WITH cte AS (
    SELECT v.user_id as user_id, visit_date, count(t.transaction_date) as transaction_count
    FROM Visits v 
    LEFT JOIN Transactions t ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
    GROUP BY 1, 2
), row_nums AS (
    SELECT ROW_NUMBER() OVER () as rn 
    FROM Transactions 
    UNION 
    SELECT 0) 
SELECT row_nums.rn as transactions_count, count(cte.transaction_count) as visits_count
FROM cte 
RIGHT JOIN row_nums ON transaction_count = rn
WHERE rn <= (SELECT MAX(transaction_count) FROM cte)
GROUP BY rn
ORDER BY 1

-- SELECT * FROM cte 
-- | user_id | visit_date | transaction_count |
-- | ------- | ---------- | ----------------- |
-- | 1       | 2020-01-01 | 0                 |
-- | 2       | 2020-01-02 | 0                 |
-- | 12      | 2020-01-01 | 0                 |
-- | 19      | 2020-01-03 | 0                 |
-- | 1       | 2020-01-02 | 1                 |
-- | 2       | 2020-01-03 | 1                 |
-- | 1       | 2020-01-04 | 1                 |
-- | 7       | 2020-01-11 | 1                 |
-- | 9       | 2020-01-25 | 3                 |
-- | 8       | 2020-01-28 | 1                 |

-- | transactions_count | visits_count |
-- | ------------------ | ------------ |
-- | 1                  | 5            |
-- | 2                  | 0            |
-- | 3                  | 1            |
-- | 0                  | 4            |
