SELECT left_operand, operator, right_operand, 
        CASE WHEN operator = '>' THEN IF(v1.value > v2.value, 'true', 'false')
             WHEN operator = '<' THEN IF(v1.value < v2.value, 'true', 'false')
             WHEN operator = '=' THEN IF(v1.value = v2.value,  'true', 'false')
        END AS value
FROM Expressions e
JOIN Variables v1 ON e.left_operand = v1.name 
JOIN Variables v2 ON e.right_operand = v2.name

/* 
Input: 
Variables table:
+------+-------+
| name | value |
+------+-------+
| x    | 66    |
| y    | 77    |
+------+-------+
Expressions table:
+--------------+----------+---------------+
| left_operand | operator | right_operand |
+--------------+----------+---------------+
| x            | >        | y             |
| x            | <        | y             |
| x            | =        | y             |
| y            | >        | x             |
| y            | <        | x             |
| x            | =        | x             |
+--------------+----------+---------------+
Output: 
+--------------+----------+---------------+-------+
| left_operand | operator | right_operand | value |
+--------------+----------+---------------+-------+
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
| y            | >        | x             | true  |
| y            | <        | x             | false |
| x            | =        | x             | true  |
+--------------+----------+---------------+-------+
Explanation: 
As shown, you need to find the value of each boolean expression in the table using the variables table.
*/