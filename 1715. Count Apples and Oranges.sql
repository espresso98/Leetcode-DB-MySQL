SELECT SUM(b.apple_count + IFNULL(c.apple_count, 0)) as apple_count, 
       SUM(b.orange_count + IFNULL(c.orange_count, 0)) as orange_count
FROM Boxes b
LEFT JOIN Chests c USING(chest_id) 
