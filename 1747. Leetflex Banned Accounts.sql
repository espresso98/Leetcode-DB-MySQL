SELECT DISTINCT t1.account_id 
FROM LogInfo t1
JOIN LogInfo t2
    ON t1.account_id = t2.account_id 
    AND t1.ip_address <> t2.ip_address
WHERE t1.login BETWEEN t2.login AND t2.logout
    OR t1.logout BETWEEN t2.login AND t2.logout