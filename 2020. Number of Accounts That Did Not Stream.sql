-- Write an SQL query to report the number of accounts that bought a subscription in 2021 but did not have any stream session.
SELECT COUNT(su.account_id) AS accounts_count
FROM Subscriptions su
LEFT JOIN Streams st ON su.account_id = st.account_id
WHERE (YEAR(su.start_date) = 2021 OR YEAR(su.end_date) = 2021) AND YEAR(st.stream_date) <> 2021
