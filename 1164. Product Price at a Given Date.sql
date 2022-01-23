--Solution1
WITH last_price AS(
    SELECT product_id, 
           LAST_VALUE(new_price) OVER(PARTITION BY product_id ORDER BY change_date 
                      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS final_price
FROM Products
WHERE change_date <= '2019-08-16'
)

SELECT DISTINCT p.product_id, IFNULL(l.final_price, 10) AS price
FROM Products p
LEFT JOIN last_price l
USING(product_id)


--Solution2
WITH last_price AS(
    SELECT product_id, new_price,
           ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS row_num
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT DISTINCT p.product_id, IFNULL(l.new_price, 10) AS price
FROM Products p
LEFT JOIN last_price l
ON p.product_id = l.product_id AND l.row_num = 1


--Solution3
SELECT distinct product_id, 10 as price
FROM Products 
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'
UNION
SELECT product_id, new_price
FROM Products 
WHERE (product_id, change_date) IN
    (
        SELECT product_id, MAX(change_date)
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )




