-- Write an SQL query to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.


SELECT id, COUNT(*) num 
FROM (
    SELECT requester_id id FROM RequestAccepted 
    UNION ALL
    SELECT accepter_id id FROM RequestAccepted
) t
GROUP BY id
ORDER BY num DESC 
LIMIT 1

/* Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+

(requester_id, accepter_id) is the primary key for this table.

Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+ */ 
