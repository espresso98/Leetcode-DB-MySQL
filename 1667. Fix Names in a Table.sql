-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.


SELECT user_id, CONCAT(UPPER(SUBSTR(name,1,1)), LOWER(SUBSTR(name,2))) name
FROM Users
ORDER BY user_id


/* Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+ */