-- Write an SQL query to report the name of the winning candidate (i.e., the candidate who got the largest number of votes).
-- The test cases are generated so that exactly one candidate wins the elections.

SELECT c.name
FROM Candidate c
JOIN Vote v
ON c.id = v.candidateId
GROUP BY v.candidateId
ORDER BY COUNT(v.candidateId) DESC
LIMIT 1


/* Candidate table:
+----+------+
| id | name |
+----+------+
| 1  | A    |
| 2  | B    |
| 3  | C    |
| 4  | D    |
| 5  | E    |
+----+------+
Vote table:
+----+-------------+
| id | candidateId |
+----+-------------+
| 1  | 2           |
| 2  | 4           |
| 3  | 3           |
| 4  | 2           |
| 5  | 5           |
+----+-------------+
Output: 
+------+
| name |
+------+
| B    |
+------+ */ 