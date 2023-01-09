-- weight limit of 1000 kilograms
-- Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. T
-- Solution1
WITH weight_sum AS (
     SELECT turn, person_name, weight, SUM(weight) OVER (ORDER BY turn) AS cum_weight FROM Queue
)
SELECT person_name 
FROM weight_sum 
WHERE turn = (SELECT MAX(turn) FROM weight_sum WHERE cum_weight <= 1000)

-- SELECT * FROM weight_sum 
-- | turn | person_name | weight | cum_weight |
-- | ---- | ----------- | ------ | ---------- |
-- | 1    | Alice       | 250    | 250        |
-- | 2    | Alex        | 350    | 600        |
-- | 3    | John Cena   | 400    | 1000       |
-- | 4    | Marie       | 200    | 1200       |
-- | 5    | Bob         | 175    | 1375       |
-- | 6    | Winston     | 500    | 1875       |


-- Solution2
SELECT person_name 
FROM (SELECT *, SUM(weight) OVER (ORDER BY turn) AS cum_sum FROM Queue) t
WHERE cum_sum <= 1000
ORDER BY cum_sum DESC
LIMIT 1
