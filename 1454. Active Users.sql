SELECT DISTINCT a.id, (SELECT name FROM Accounts WHERE id = a.id) AS name
FROM Logins a
JOIN Logins b USING(id)
WHERE DATEDIFF(a.login_date, b.login_date) BETWEEN 1 AND 4
GROUP BY a.id, a.login_date
HAVING COUNT(DISTINCT b.login_date) = 4
ORDER BY 1