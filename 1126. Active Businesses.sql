-- The average activity for a particular event_type is the average occurences across all companies that have this event.
-- An active business is a business that has more than one event_type such that their occurences is strictly greater than the average activity for that event.
-- Write an SQL query to find all active businesses.

-- | event_type | avg_occur |
-- | ---------- | --------- |
-- | reviews    | 5         |
-- | ads        | 8         |
-- | page views | 7.5       |
-- --------------------------

WITH cte AS (
    SELECT business_id, event_type, AVG(occurences) AS avg_occur 
    FROM Events 
    GROUP BY event_type
)
SELECT e.business_id
FROM Events e
JOIN cte ON e.event_type = cte.event_type AND e.occurences > avg_occur
GROUP BY e.business_id 
HAVING COUNT(e.event_type) > 1 
