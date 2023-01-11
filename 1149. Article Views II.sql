# There is no primary key for this table, it may have duplicate rows.
# Write an SQL query to find all the people who viewed more than one article on the same date. Return the result table sorted by id in ascending order.
SELECT DISTINCT viewer_id AS id
FROM Views
GROUP BY view_date, viewer_id
HAVING COUNT(DISTINCT article_id) > 1
ORDER BY id


-- | view_date  | id |
-- | ---------- | -- |
-- | 2019-07-21 | 4  |
-- | 2019-07-22 | 1  |
-- | 2019-08-01 | 5  |
-- | 2019-08-01 | 7  |
-- | 2019-08-02 | 6  |
