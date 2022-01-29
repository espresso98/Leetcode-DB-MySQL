-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

--Solution1
UPDATE Salary SET sex = (
    CASE WHEN sex = 'f' THEN 'm' ELSE 'f' END
)

--Solution2
UPDATE Salary SET sex = IF (sex='f', 'm', 'f');