-- Write an SQL query to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

SELECT student_id, student_name, subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students 
CROSS JOIN Subjects
LEFT JOIN Examinations e
    USING(student_id, subject_name)
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name 