# Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

--Solution1
WITH cte AS (
    SELECT seller_id,  
        SUM(price) AS total_sales
    FROM Sales
    GROUP BY seller_id
)

SELECT seller_id
FROM cte
WHERE total_sales = (SELECT MAX(total_sales) FROM cte)

--Solution2
WITH cte AS (
    SELECT seller_id,  
        DENSE_RANK() OVER (ORDER BY SUM(price) DESC) AS sales_rank
    FROM Sales
    GROUP BY seller_id
)

SELECT seller_id
FROM cte
WHERE sales_rank = 1

--Solution3
SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
					 FROM Sales
                     GROUP BY seller_id
                     ORDER BY 1 DESC
                     LIMIT 1)