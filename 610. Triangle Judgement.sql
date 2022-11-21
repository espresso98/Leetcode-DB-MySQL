-- Write an SQL query to report for every three line segments whether they can form a triangle.
-- Solution 1
SELECT x, y, z, 
    CASE 
        WHEN GREATEST(x,y,z) < x + y + z - GREATEST(x,y,z) THEN 'Yes' 
        ELSE 'No' 
    END AS triangle
FROM Triangle

-- Solution 2
SELECT x, y, z, IF(x+y>z and x+z>y and y+z>x, 'Yes', 'No') AS triangle 
FROM Triangle
