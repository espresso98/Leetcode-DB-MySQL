-- Write an SQL query to report the difference between the number of apples and oranges sold each day.

SELECT sale_date, 
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date
