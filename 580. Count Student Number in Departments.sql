-- Write an SQL query to report the respective department name and number of students majoring in each department for all departments in the Department table (even ones with no current students).
-- Return the result table ordered by student_number in descending order. In case of a tie, order them by dept_name alphabetically.

SELECT dept_name, COUNT(student_id) AS student_number
FROM Department d 
LEFT JOIN Student s
ON s.dept_id = d.dept_id
GROUP BY d.dept_id
ORDER BY 2 DESC, 1 ASC


/* Input: 
Student table:
+------------+--------------+--------+---------+
| student_id | student_name | gender | dept_id |
+------------+--------------+--------+---------+
| 1          | Jack         | M      | 1       |
| 2          | Jane         | F      | 1       |
| 3          | Mark         | M      | 2       |
+------------+--------------+--------+---------+

student_id is the primary key column for this table.
dept_id is a foreign key to dept_id in the Department tables.


Department table:
+---------+-------------+
| dept_id | dept_name   |
+---------+-------------+
| 1       | Engineering |
| 2       | Science     |
| 3       | Law         |
+---------+-------------+

dept_id is the primary key column for this table.


Output: 
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering | 2              |
| Science     | 1              |
| Law         | 0              |
+-------------+----------------+ */ 

