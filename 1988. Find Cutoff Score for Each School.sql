SELECT school_id, IFNULL(MIN(score), -1) AS score
FROM Schools
LEFT JOIN Exam
ON student_count <= capacity
GROUP BY 1
