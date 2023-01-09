-- Solution1
WITH player_score AS (
    SELECT first_player AS player_id, first_score AS score FROM Matches
    UNION ALL 
    SELECT second_player AS player_id, second_score AS score FROM Matches
), final_scores AS (
    SELECT p.group_id, ps.player_id, sum(score) AS score
    FROM player_score ps
    JOIN Players p USING(player_id)
    GROUP BY 1, 2
), final_ranks AS(
    SELECT *,
    RANK() OVER(PARTITION BY group_id ORDER BY score DESC, player_id) AS score_rank
    FROM final_scores
)
SELECT group_id, player_id FROM final_ranks WHERE score_rank = 1

-- SELECT * FROM final_ranks
-- | group_id | player_id | score | score_rank |
-- | -------- | --------- | ----- | ---------- |
-- | 1        | 15        | 3     | 1          |
-- | 1        | 30        | 3     | 2          |
-- | 1        | 25        | 2     | 3          |
-- | 1        | 45        | 0     | 4          |
-- | 2        | 35        | 1     | 1          |
-- | 2        | 50        | 1     | 2          |
-- | 3        | 40        | 5     | 1          |
-- | 3        | 20        | 2     | 2          |

-- Solution2
WITH player_rank AS (
    SELECT group_id, player_id,
        RANK() OVER(PARTITION BY group_id ORDER BY 
        SUM(CASE WHEN player_id = first_player THEN first_score ELSE second_score END) DESC
        , player_id ASC) score_rank
    FROM Matches m
    JOIN Players p ON player_id in (first_player, second_player)
    GROUP BY 1, 2
)
SELECT group_id, player_id
FROM player_rank 
WHERE score_rank = 1
 
--  | group_id | player_id | score_rank |
--  | -------- | --------- | ---------- |
--  | 1        | 15        | 1          |
--  | 1        | 30        | 2          |
--  | 1        | 25        | 3          |
--  | 1        | 45        | 4          |
--  | 2        | 35        | 1          |
--  | 2        | 50        | 2          |
--  | 3        | 40        | 1          |
--  | 3        | 20        | 2          |
