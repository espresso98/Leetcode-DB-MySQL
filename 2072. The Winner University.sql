-- An excellent student is a student that scored 90% or more in the exam.
-- Write an SQL query to report:
-- "New York University" if New York University wins the competition.
-- "California University" if California University wins the competition.
-- "No Winner" if the competition ends in a draw.


WITH nyu_excellent AS (
    SELECT COUNT(student_id) AS cnt_NY FROM NewYork WHERE score >= 90 
), cu_excellent AS (
    SELECT COUNT(student_id) AS cnt_Cal FROM California WHERE score >= 90
)

SELECT (CASE WHEN cnt_NY > cnt_Cal THEN "New York University"
             WHEN cnt_NY < cnt_Cal THEN "California University"
             ELSE "No Winner"  
        END) AS winner  
FROM nyu_excellent, cu_excellent



/* Input: 
NewYork table:
+------------+-------+
| student_id | score |
+------------+-------+
| 1          | 90    |
| 2          | 87    |
+------------+-------+
California table:
+------------+-------+
| student_id | score |
+------------+-------+
| 2          | 89    |
| 3          | 88    |
+------------+-------+
Output: 
+---------------------+
| winner              |
+---------------------+
| New York University |
+---------------------+ */