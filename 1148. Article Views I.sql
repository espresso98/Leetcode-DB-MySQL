-- Write an SQL query to find all the authors that viewed at least one of their own articles.

SELECT DISTINCT author_id AS id
FROM Views 
WHERE author_id = viewer_id
ORDER BY id 