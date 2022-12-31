WITH RECURSIVE rec_cte AS (
    SELECT num, frequency, 1 AS cnt
    FROM Numbers
    UNION
    SELECT num, frequency, cnt+1 
    FROM rec_cte
    WHERE cnt < frequency
), 
med_cte AS (
    SELECT num, frequency, cnt,
        ROW_NUMBER() OVER(ORDER BY num) AS row_num,
        COUNT(*) OVER() AS total_cnt
    FROM rec_cte
)
SELECT CASE WHEN MOD(total_cnt,2)=0 THEN ROUND(AVG(num),1)
        ELSE num END AS median 
FROM med_cte
WHERE row_num BETWEEN total_cnt/2 and total_cnt/2 + 1
