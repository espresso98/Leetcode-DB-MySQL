--Solution1
SELECT MIN(p1.x - p2.x) AS shortest
FROM Point p1
JOIN Point p2
    ON p1.x > p2.x


--Solution2
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1
JOIN Point p2
    ON p1.x != p2.x