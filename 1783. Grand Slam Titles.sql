--Solution1
SELECT player_id,
       player_name,
       SUM(IF(player_id = Wimbledon, 1, 0) +
           IF(player_id = Fr_open, 1, 0) +
           IF(player_id = US_open, 1, 0) +
           IF(player_id = Au_open, 1, 0)) AS grand_slams_count 
FROM Players
JOIN Championships 
ON player_id = Wimbledon OR player_id = Fr_open
   OR player_id = US_open OR player_id = AU_open
GROUP BY 1, 2


--Solution2
SELECT player_id, 
       player_name,
       SUM(CASE WHEN player_id = Wimbledon THEN 1 ELSE 0 END
         + CASE WHEN player_id = Fr_open THEN 1 ELSE 0 END
         + CASE WHEN player_id = US_open THEN 1 ELSE 0 END
         + CASE WHEN player_id = AU_open THEN 1 ELSE 0 END
         ) as grand_slams_count
FROM Players 
JOIN Championships 
ON player_id = Wimbledon OR player_id = Fr_open
   OR player_id = US_open OR player_id = AU_open
GROUP BY 1, 2


--Solution3
SELECT player_id, player_name,
     SUM(player_id = Wimbledon) + SUM(player_id = Fr_open) +
     SUM(player_id = US_open) + SUM(player_id = Au_open) AS grand_slams_count
FROM Players
JOIN Championships
ON player_id = Wimbledon or player_id = Fr_open or player_id = US_open or player_id = Au_open
GROUP BY 1


