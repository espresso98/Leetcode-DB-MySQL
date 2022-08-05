SELECT
  TABLE_SCHEMA AS `Database`,
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE TABLE_SCHEMA = "billing" AND TABLE_NAME = "billdata"
ORDER BY (DATA_LENGTH + INDEX_LENGTH);


-- mysql> source datasize.sql
-- +----------+----------+-----------+
-- | Database | Table    | Size (MB) |
-- +----------+----------+-----------+
-- | billing  | billdata |         7 |
-- +----------+----------+-----------+
-- 1 row in set (0.01 sec)