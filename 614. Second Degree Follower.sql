-- Write an SQL query to report the second-degree users and the number of their followers.
-- Return the result table ordered by follower in alphabetical order.
/* 
Create table If Not Exists Follow (followee varchar(255), follower varchar(255))
Truncate table Follow
insert into Follow (followee, follower) values ('Alice', 'Bob')
insert into Follow (followee, follower) values ('Bob', 'Cena')
insert into Follow (followee, follower) values ('Bob', 'Donald')
insert into Follow (followee, follower) values ('Donald', 'Edward') 
*/

SELECT followee follower, COUNT(DISTINCT follower) num
FROM Follow
WHERE followee IN (SELECT DISTINCT follower FROM Follow)
GROUP BY 1
ORDER BY 1


/* Input: 
Follow table:
+----------+----------+
| followee | follower |
+----------+----------+
| Alice    | Bob      |
| Bob      | Cena     |
| Bob      | Donald   |
| Donald   | Edward   |
+----------+----------+
Output: 
+----------+-----+
| follower | num |
+----------+-----+
| Bob      | 2   |
| Donald   | 1   |
+----------+-----+ */ 