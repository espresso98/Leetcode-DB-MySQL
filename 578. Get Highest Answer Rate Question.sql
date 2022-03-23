-- The answer rate for a question is the number of times a user answered the question by the number of times a user showed the question.
-- Write an SQL query to report the question that has the highest answer rate. If multiple questions have the same maximum answer rate, report the question with the smallest question_id.


SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY question_id 
ORDER BY SUM(action = 'answer') / SUM(action = 'show') DESC
LIMIT 1


/* SurveyLog table:
+----+--------+-------------+-----------+-------+-----------+
| id | action | question_id | answer_id | q_num | timestamp |
+----+--------+-------------+-----------+-------+-----------+
| 5  | show   | 285         | null      | 1     | 123       |
| 5  | answer | 285         | 124124    | 1     | 124       |
| 5  | show   | 369         | null      | 2     | 125       |
| 5  | skip   | 369         | null      | 2     | 126       |
+----+--------+-------------+-----------+-------+-----------+
There is no primary key for this table.

Output: 
+------------+
| survey_log |
+------------+
| 285        |
+------------+ */