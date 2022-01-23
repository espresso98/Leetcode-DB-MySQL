--Solution1
WITH order_cnt AS 
(     SELECT customer_number, COUNT(*) cnt
     FROM Orders
     GROUP BY customer_number
)

SELECT customer_number
FROM order_cnt
WHERE cnt = (SELECT MAX(cnt) FROM order_cnt)


--Solution2
SELECT customer_number
FROM orders
GROUP BY customer_number
HAVING COUNT(order_number) = (
	SELECT COUNT(order_number) cnt
	FROM orders
	GROUP BY customer_number
	ORDER BY cnt DESC
	LIMIT 1
)