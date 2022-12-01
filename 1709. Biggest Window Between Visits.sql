WITH next_visit AS (
    SELECT user_id, visit_date,
        LEAD(visit_date, 1, '2021-1-1') OVER(PARTITION BY user_id ORDER BY visit_date) AS next_visit_date
    FROM UserVisits
)
SELECT user_id, MAX(DATEDIFF(next_visit_date, visit_date)) AS biggest_window
FROM next_visit
GROUP BY 1
ORDER BY 1


/* Input: 
UserVisits table:
+---------+------------+
| user_id | visit_date |
+---------+------------+
| 1       | 2020-11-28 |
| 1       | 2020-10-20 |
| 1       | 2020-12-3  |
| 2       | 2020-10-5  |
| 2       | 2020-12-9  |
| 3       | 2020-11-11 |
+---------+------------+
Output: 
+---------+---------------+
| user_id | biggest_window|
+---------+---------------+
| 1       | 39            |
| 2       | 65            |
| 3       | 51            |
+---------+---------------+
*/
