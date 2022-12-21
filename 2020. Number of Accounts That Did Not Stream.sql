-- Write an SQL query to report the number of accounts that bought a subscription in 2021 but did not have any stream session.
-- Solution1
SELECT COUNT(su.account_id) AS accounts_count
FROM Subscriptions su
LEFT JOIN Streams st ON su.account_id = st.account_id
WHERE (YEAR(su.start_date) = 2021 OR YEAR(su.end_date) = 2021) AND YEAR(st.stream_date) <> 2021

-- Solution2
SELECT COUNT(account_id) AS accounts_count FROM Subscriptions
WHERE (YEAR(start_date) = 2021 OR YEAR(end_date) = 2021)
AND account_id NOT IN(
    SELECT DISTINCT account_id FROM Streams
    WHERE YEAR(stream_date) = 2021
)
