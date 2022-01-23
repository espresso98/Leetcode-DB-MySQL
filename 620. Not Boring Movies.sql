--Solution1
SELECT *
FROM Cinema
WHERE description != 'boring' AND MOD(id, 2) = 1
ORDER BY rating DESC


--Solution2
SELECT id, movie, description, rating
FROM Cinema
WHERE LOWER(description) NOT LIKE '%boring%' AND MOD(id, 2) = 1
ORDER BY rating DESC