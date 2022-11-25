-- Solution1
SELECT m.symbol as metal, nm.symbol as nonmetal
FROM Elements m
JOIN Elements nm
ON m.type = 'Metal' AND nm.type = 'Nonmetal'

-- Solution2
WITH m AS (SELECT symbol FROM Elements WHERE type = 'Metal'), 
    nm AS (SELECT symbol FROM Elements WHERE type = 'Nonmetal')
SELECT m.symbol as metal, nm.symbol as nonmetal 
FROM m CROSS JOIN nm