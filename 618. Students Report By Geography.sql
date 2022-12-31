-- Write an SQL query to pivot the continent column in the Student table 
-- so that each name is sorted alphabetically and displayed underneath its corresponding continent.

-- | name   | continent | row_id |
-- | ------ | --------- | ------ |
-- | Jack   | America   | 1      |
-- | Jane   | America   | 2      |
-- | Xi     | Asia      | 1      |
-- | Pascal | Europe    | 1      |

-- | row_id | America | Asia | Europe |
-- | ------ | ------- | ---- | ------ |
-- | 1      | Jack    | Xi   | Pascal |
-- | 2      | Jane    |      |        |

SELECT MAX(CASE WHEN continent='America' THEN name END) AS America,
       MAX(CASE WHEN continent='Asia' THEN name END) AS Asia,
       MAX(CASE WHEN continent='Europe' THEN name END) AS Europe  
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY continent ORDER BY name) AS row_id 
    FROM student
    ) AS t
GROUP BY row_id


-- Input: 
-- Student table:
-- +--------+-----------+
-- | name   | continent |
-- +--------+-----------+
-- | Jane   | America   |
-- | Pascal | Europe    |
-- | Xi     | Asia      |
-- | Jack   | America   |
-- +--------+-----------+
-- Output: 
-- +---------+------+--------+
-- | America | Asia | Europe |
-- +---------+------+--------+
-- | Jack    | Xi   | Pascal |
-- | Jane    | null | null   |
-- +---------+------+--------+
