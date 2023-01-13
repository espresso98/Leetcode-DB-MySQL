-- Write an SQL query to find for each month and country: the number of approved transactions and their total amount, the number of chargebacks, and their total amount. Note: In your query, given the month and country, ignore rows with all zeros.
WITH cte AS (
    SELECT id, country, state, amount, DATE_FORMAT(trans_date,"%Y-%m") AS `month`
    FROM Transactions
    WHERE state = 'approved'
    UNION ALL
    SELECT trans_id AS id, country, 'chargeback' AS state, amount, DATE_FORMAT(c.trans_date,"%Y-%m") AS `month`
    FROM Chargebacks c
    LEFT JOIN Transactions t ON c.trans_id = t.id
)
SELECT `month`, country,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(IF(state = 'approved', amount, 0)) AS approved_amount,
    SUM(IF(state = 'chargeback', 1, 0)) AS chargeback_count, 
    SUM(IF(state = 'chargeback', amount, 0)) AS chargeback_amount
FROM cte
GROUP BY 1, 2
ORDER BY 1, 2

-- SELECT * FROM cte
-- | id  | country | state      | amount | month   |
-- | --- | ------- | ---------- | ------ | ------- |
-- | 101 | US      | approved   | 1000   | 2019-05 |
-- | 103 | US      | approved   | 3000   | 2019-06 |
-- | 105 | US      | approved   | 5000   | 2019-06 |
-- | 102 | US      | chargeback | 2000   | 2019-05 |
-- | 101 | US      | chargeback | 1000   | 2019-06 |
-- | 105 | US      | chargeback | 5000   | 2019-09 |


-- Input: 
-- Transactions table:
-- +-----+---------+----------+--------+------------+
-- | id  | country | state    | amount | trans_date |
-- +-----+---------+----------+--------+------------+
-- | 101 | US      | approved | 1000   | 2019-05-18 |
-- | 102 | US      | declined | 2000   | 2019-05-19 |
-- | 103 | US      | approved | 3000   | 2019-06-10 |
-- | 104 | US      | declined | 4000   | 2019-06-13 |
-- | 105 | US      | approved | 5000   | 2019-06-15 |
-- +-----+---------+----------+--------+------------+
-- Chargebacks table:
-- +----------+------------+
-- | trans_id | trans_date |
-- +----------+------------+
-- | 102      | 2019-05-29 |
-- | 101      | 2019-06-30 |
-- | 105      | 2019-09-18 |
-- +----------+------------+
-- Output: 
-- +---------+---------+----------------+-----------------+------------------+-------------------+
-- | month   | country | approved_count | approved_amount | chargeback_count | chargeback_amount |
-- +---------+---------+----------------+-----------------+------------------+-------------------+
-- | 2019-05 | US      | 1              | 1000            | 1                | 2000              |
-- | 2019-06 | US      | 2              | 8000            | 1                | 1000              |
-- | 2019-09 | US      | 0              | 0               | 1                | 5000              |
-- +---------+---------+----------------+-----------------+------------------+-------------------+