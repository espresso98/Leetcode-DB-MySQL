-- Write an SQL query to find the average daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.

SELECT ROUND(AVG(cnt_pct), 2) AS average_daily_percent 
FROM (
    SELECT (COUNT(DISTINCT r.post_id)/ COUNT(DISTINCT a.post_id)) * 100  AS cnt_pct
    FROM Actions a
    LEFT JOIN Removals r
    ON a.post_id = r.post_id
    WHERE extra='spam'
    GROUP BY action_date) tmp


-- Input: 
-- Actions table:
-- +---------+---------+-------------+--------+--------+
-- | user_id | post_id | action_date | action | extra  |
-- +---------+---------+-------------+--------+--------+
-- | 1       | 1       | 2019-07-01  | view   | null   |
-- | 1       | 1       | 2019-07-01  | like   | null   |
-- | 1       | 1       | 2019-07-01  | share  | null   |
-- | 2       | 2       | 2019-07-04  | view   | null   |
-- | 2       | 2       | 2019-07-04  | report | spam   |
-- | 3       | 4       | 2019-07-04  | view   | null   |
-- | 3       | 4       | 2019-07-04  | report | spam   |
-- | 4       | 3       | 2019-07-02  | view   | null   |
-- | 4       | 3       | 2019-07-02  | report | spam   |
-- | 5       | 2       | 2019-07-03  | view   | null   |
-- | 5       | 2       | 2019-07-03  | report | racism |
-- | 5       | 5       | 2019-07-03  | view   | null   |
-- | 5       | 5       | 2019-07-03  | report | racism |
-- +---------+---------+-------------+--------+--------+
-- Removals table:
-- +---------+-------------+
-- | post_id | remove_date |
-- +---------+-------------+
-- | 2       | 2019-07-20  |
-- | 3       | 2019-07-18  |
-- +---------+-------------+
-- Output: 
-- +-----------------------+
-- | average_daily_percent |
-- +-----------------------+
-- | 75.00                 |
-- +-----------------------+


-- SELECT a.post_id, action_date, extra, COUNT(DISTINCT r.post_id), COUNT(DISTINCT a.post_id), (COUNT(DISTINCT r.post_id)/ COUNT(DISTINCT a.post_id)) * 100  AS cnt_pct
--     FROM Actions a
--     LEFT JOIN Removals r
--     ON a.post_id = r.post_id
--     WHERE extra='spam'
--     GROUP BY action_date
-- ORDER BY a.post_id

-- | post_id | action_date | extra | COUNT(DISTINCT r.post_id) | COUNT(DISTINCT a.post_id) | cnt_pct |
-- | ------- | ----------- | ----- | ------------------------- | ------------------------- | ------- |
-- | 2       | 2019-07-04  | spam  | 1                         | 2                         | 50      |
-- | 3       | 2019-07-02  | spam  | 1                         | 1                         | 100     |