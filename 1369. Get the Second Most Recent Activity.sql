WITH cte AS (
    SELECT username, activity, startDate, endDate, 
    RANK() OVER(PARTITION BY username ORDER BY endDate DESC) AS recent_rank,
    COUNT(activity) OVER(PARTITION BY username) AS num_acitivity
    FROM UserActivity
)
SELECT username, activity, startDate, endDate
FROM cte
WHERE recent_rank = 2 OR num_acitivity = 1
