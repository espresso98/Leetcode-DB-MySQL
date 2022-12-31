-- Write an SQL query to generate a report of period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.

--  | period_state | dt         | rnk | DATE_SUB(dt, INTERVAL rnk DAY) |
--  | ------------ | ---------- | --- | ------------------------------- |
--  | failed       | 2019-01-04 | 1   | 2019-01-03                      |
--  | failed       | 2019-01-05 | 2   | 2019-01-03                      |
--  | succeeded    | 2019-01-01 | 1   | 2018-12-31                      |
--  | succeeded    | 2019-01-02 | 2   | 2018-12-31                      |
--  | succeeded    | 2019-01-03 | 3   | 2018-12-31                      |
--  | succeeded    | 2019-01-06 | 4   | 2019-01-02                      |

WITH cte AS (
    SELECT 'failed' AS period_state, fail_date AS dt,
            DENSE_RANK() OVER(ORDER BY fail_date) AS rnk
    FROM Failed 
    WHERE LEFT(fail_date,4) = '2019'
    UNION ALL
    SELECT 'succeeded' as period_state, success_date AS dt,
            DENSE_RANK() OVER(ORDER BY success_date) AS rnk
    FROM Succeeded 
    WHERE LEFT(success_date,4) = '2019'
)
SELECT period_state, MIN(dt) AS start_date, MAX(dt) AS end_date
FROM cte
GROUP BY 1, DATE_SUB(dt, INTERVAL rnk DAY)  -- contiguous range
ORDER BY 2


-- Failed table:
-- +-------------------+
-- | fail_date         |
-- +-------------------+
-- | 2018-12-28        |
-- | 2018-12-29        |
-- | 2019-01-04        |
-- | 2019-01-05        |
-- +-------------------+
-- Succeeded table:
-- +-------------------+
-- | success_date      |
-- +-------------------+
-- | 2018-12-30        |
-- | 2018-12-31        |
-- | 2019-01-01        |
-- | 2019-01-02        |
-- | 2019-01-03        |
-- | 2019-01-06        |
-- +-------------------+
-- Output: 
-- +--------------+--------------+--------------+
-- | period_state | start_date   | end_date     |
-- +--------------+--------------+--------------+
-- | succeeded    | 2019-01-01   | 2019-01-03   |
-- | failed       | 2019-01-04   | 2019-01-05   |
-- | succeeded    | 2019-01-06   | 2019-01-06   |
-- +--------------+--------------+--------------+
