-- Write an SQL query to report the latest login for all users in the year 2020. 
-- Do not include the users who did not login in 2020.

SELECT user_id, MAX(time_stamp) last_stamp 
FROM Logins
WHERE YEAR(time_stamp) = 2020
GROUP BY 1
