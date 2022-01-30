-- Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05

SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action = 'report' AND action_date = '2019-07-04'
GROUP BY extra