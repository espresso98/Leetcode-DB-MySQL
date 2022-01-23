--Solution1
SELECT MAX(num) as num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ) t;

--Solution2
SELECT MAX(num) AS num
FROM (
    SELECT num, COUNT(num) OVER(PARTITION BY num) AS cnt
    FROM MyNumbers) t
WHERE cnt = 1