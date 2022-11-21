-- Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exist.

SELECT id, name
FROM Students 
WHERE department_id NOT IN (SELECT id FROM Departments)
