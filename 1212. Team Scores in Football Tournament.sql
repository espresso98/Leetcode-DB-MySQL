-- Solution1
SELECT team_id, team_name, 
    SUM(IF(team_id = host_team AND host_goals > guest_goals, 3, 0) + 
        IF(team_id = guest_team AND guest_goals > host_goals, 3, 0) +
        IF(team_id = host_team AND host_goals = guest_goals, 1, 0) +
        IF(team_id = guest_team AND guest_goals = host_goals, 1, 0))
    AS num_points
FROM Teams 
LEFT JOIN Matches m ON team_id IN (host_team, guest_team)
GROUP BY team_id, team_name
ORDER BY 3 DESC, 1

-- Solution2
SELECT team_id,team_name,
    SUM(CASE WHEN team_id = host_team AND host_goals > guest_goals THEN 3
             WHEN team_id = guest_team AND guest_goals > host_goals THEN 3
             WHEN team_id = host_team AND host_goals = guest_goals THEN 1
             WHEN team_id = guest_team AND guest_goals = host_goals THEN 1 ELSE 0 END) AS num_points
FROM Teams 
LEFT JOIN Matches m ON team_id IN (host_team, guest_team)
GROUP BY team_id, team_name
ORDER BY 3 DESC, 1
