-- A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not return the student who has never taken any exam.
-- Return the result table ordered by student_id.

WITH cte AS 
(
	SELECT exam_id, student_id, 
	RANK() OVER(PARTITION BY exam_id ORDER BY score) AS low_rank,
    RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) AS high_rank
	FROM Exam 
)
SELECT DISTINCT e.student_id, s.student_name
FROM Exam e 
LEFT JOIN Student s USING(student_id)
WHERE e.student_id NOT IN (SELECT student_id FROM cte WHERE high_rank = 1 OR low_rank = 1)
ORDER BY 1
