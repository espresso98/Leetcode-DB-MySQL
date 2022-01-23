--Soultion1
SELECT seat_id
FROM Cinema
WHERE free = 1 AND 
    (seat_id - 1 IN (SELECT seat_id FROM Cinema WHERE free = 1) OR
     seat_id + 1 IN (SELECT seat_id FROM Cinema WHERE free = 1))
ORDER BY seat_id


--Soultion2
WITH is_consecutive AS (
    SELECT seat_id, free,
        LAG(free, 1) OVER (ORDER BY seat_id) AS prev,
        LEAD(free, 1) OVER (ORDER BY seat_id) AS next
    FROM Cinema   
)

SELECT seat_id
FROM is_consecutive
WHERE free = 1 AND (prev = 1 OR next = 1)
ORDER BY 1