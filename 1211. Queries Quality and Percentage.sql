# quality: The average of the ratio between query rating and its position.
# poor query percentage: The percentage of all queries with rating less than 3.

--Solution1
SELECT query_name,   
    ROUND(AVG(rating/position) , 2) AS quality,   
    ROUND(AVG(rating < 3) * 100 , 2) AS poor_query_percentage       
FROM Queries
GROUP BY query_name

--Solution2
SELECT query_name,   
    ROUND(AVG(rating/position) , 2) AS quality,   
    ROUND(SUM(IF(rating < 3, 1, 0))/COUNT(rating) * 100, 2) AS poor_query_percentage       
FROM Queries
GROUP BY query_name