-- Write an SQL query to report the type of each node in the tree.
-- Return the result table ordered by id in ascending order.
/* Each node in the tree can be one of three types:
"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node. */

SELECT id, 
       CASE WHEN  p_id IS NULL THEN 'Root' 
            WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
            ELSE 'Leaf' 
       END type     
FROM Tree
ORDER BY 1 

/* Input: 
Tree table:
+----+------+
| id | p_id |
+----+------+
| 1  | null |
| 2  | 1    |
| 3  | 1    |
| 4  | 2    |
| 5  | 2    |
+----+------+

id is the primary key column for this table.


Output: 
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+ */ 

