-- Write an SQL query to report the total sales amount of each item for each year, with corresponding product_name, product_id, product_name, and report_year.
-- The dates of the sales years are between 2018 to 2020.

-- | date       |
-- | ---------- |
-- | 2018-12-01 |
-- | 2018-12-02 |
-- | 2018-12-03 |
-- ...

-- Solution1
WITH RECURSIVE days AS (
    SELECT MIN(period_start) as date
    FROM Sales 
    UNION ALL
    SELECT DATE_ADD(date, INTERVAL 1 day)
    FROM days
    WHERE date < (SELECT MAX(period_end) FROM Sales)
)
SELECT s.product_id, p.product_name, LEFT(c.date,4) AS report_year, 
    SUM(s.average_daily_sales) as total_amount
FROM Sales s
JOIN Product p ON p.product_id = s.product_id
JOIN days c ON c.date BETWEEN s.period_start AND s.period_end
GROUP BY 1,2,3 
ORDER BY 1,3


-- Solution2
WITH RECURSIVE years AS (
    SELECT YEAR(MIN(period_start)) AS y FROM Sales
    UNION
    SELECT y+1 FROM years WHERE y < (SELECT YEAR(MAX(period_end)) FROM Sales)
)
SELECT s.product_id, product_name, CAST(y AS CHAR) AS report_year,
    (DATEDIFF(
        LEAST(s.period_end, DATE(CONCAT(y,'-12-31'))), 
        GREATEST(s.period_start, DATE(CONCAT(y,'-01-01')))
    ) + 1) * average_daily_sales AS total_amount
FROM Sales s 
JOIN years ON y BETWEEN YEAR(period_start) AND YEAR(period_end)
JOIN product p ON p.product_id = s.product_id
ORDER BY 1,3
