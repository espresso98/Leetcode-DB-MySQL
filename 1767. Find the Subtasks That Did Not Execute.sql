-- Write an SQL query to report the IDs of the missing subtasks for each task_id.
WITH RECURSIVE cte AS (
    SELECT task_id, subtasks_count 
    FROM Tasks
    UNION
    SELECT task_id, subtasks_count-1 
    FROM cte
    WHERE subtasks_count > 1
)
SELECT task_id, subtasks_count AS subtask_id 
FROM cte
WHERE (task_id, subtasks_count) NOT IN (
    SELECT task_id, subtask_id FROM Executed
)
