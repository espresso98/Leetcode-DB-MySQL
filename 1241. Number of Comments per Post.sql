--Write an SQL query to find the number of comments per post. The result table should contain post_id and its corresponding number_of_comments.
--Each row can be a post or comment on the post.
--parent_id is null for posts. parent_id for comments is sub_id for another post in the table.

SELECT p.sub_id AS post_id, COUNT(DISTINCT c.sub_id) AS number_of_comments
FROM Submissions p -- post
LEFT JOIN Submissions c  -- comment
ON p.sub_id = c.parent_id
WHERE p.parent_id IS NULL
GROUP BY p.sub_id
ORDER BY post_id