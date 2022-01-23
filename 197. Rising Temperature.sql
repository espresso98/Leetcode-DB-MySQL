--Solution1
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature


--Solution2
SELECT id
FROM
(SELECT *, 
    LAG(temperature,1) OVER (ORDER BY recordDate)  AS prevTemp,
    LAG(recordDate,1) OVER (ORDER BY recordDate)  AS prevDate
    FROM Weather) w
WHERE temperature > prevTemp
    AND DATEDIFF(recordDate, prevDate) = 1