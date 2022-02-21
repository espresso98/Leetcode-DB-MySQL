--  Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

SELECT DISTINCT title 
FROM TVProgram
LEFT JOIN Content c 
USING(content_id)
WHERE MONTH(program_date) = 6       -- OR
    AND YEAR(program_date) = 2020   -- program_date LIKE '2020-06%'
    AND Kids_content= 'Y'
    AND content_type = 'Movies'



/* Input: 
TVProgram table:
+--------------------+--------------+-------------+
| program_date       | content_id   | channel     |
+--------------------+--------------+-------------+
| 2020-06-10 08:00   | 1            | LC-Channel  |
| 2020-05-11 12:00   | 2            | LC-Channel  |
| 2020-05-12 12:00   | 3            | LC-Channel  |
| 2020-05-13 14:00   | 4            | Disney Ch   |
| 2020-06-18 14:00   | 4            | Disney Ch   |
| 2020-07-15 16:00   | 5            | Disney Ch   |
+--------------------+--------------+-------------+
Content table:
+------------+----------------+---------------+---------------+
| content_id | title          | Kids_content  | content_type  |
+------------+----------------+---------------+---------------+
| 1          | Leetcode Movie | N             | Movies        |
| 2          | Alg. for Kids  | Y             | Series        |
| 3          | Database Sols  | N             | Series        |
| 4          | Aladdin        | Y             | Movies        |
| 5          | Cinderella     | Y             | Movies        |
+------------+----------------+---------------+---------------+
Output: 
+--------------+
| title        |
+--------------+
| Aladdin      |
+--------------+ */ 