-- Write an SQL query to report all possible axis-aligned rectangles with a non-zero area that can be formed by any two points from the Points table.

SELECT p1.id AS p1, p2.id AS p2, 
     ABS(p2.y_value - p1.y_value) * ABS(p2.x_value - p1.x_value) AS area
FROM Points p1
JOIN Points p2
ON p1.id < p2.id AND p1.x_value <> p2.x_value AND p1.y_value <> p2.y_value
ORDER BY 3 DESC, 1, 2
