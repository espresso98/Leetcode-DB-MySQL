-- Write an SQL query to report the shortest distance between any two points from the Point2D table. Round the distance to two decimal points.

SELECT ROUND(MIN(SQRT(POW(p1.x-p2.x, 2) + POW(p1.y-p2.y, 2))), 2) shortest
FROM Point2D p1
JOIN Point2D p2
ON (p1.x, p1.y) <> (p2.x, p2.y)


/* Input: 
Point2D table:
+----+----+
| x  | y  |
+----+----+
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
+----+----+

(x, y) is the primary key column for this table.


Output: 
+----------+
| shortest |
+----------+
| 1.00     |
+----------+ */ 