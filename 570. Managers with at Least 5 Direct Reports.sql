-- Write an SQL query to report the managers with at least five direct reports.

-- Solution1
SELECT m.name
FROM Employee m
JOIN Employee e
ON e.managerId = m.id
GROUP BY e.managerId
HAVING COUNT(e.managerId) >= 5


-- Solution2
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5)


/* Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+ */