-- Write a SQL query to find the highest grade with its corresponding course for each student. In case of a tie, you should find the course with the smallest course_id.

SELECT student_id, MIN(course_id) AS course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN
    (SELECT student_id, MAX(grade)
    FROM Enrollments
    GROUP BY 1)
GROUP BY 1
ORDER BY 1
