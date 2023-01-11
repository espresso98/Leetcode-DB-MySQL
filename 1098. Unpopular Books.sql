-- Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding books that have been available for less than one month from today. Assume today is 2019-06-23
SELECT book_id, name
FROM Books
WHERE available_from < DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
AND book_id NOT IN (
    SELECT book_id FROM Orders 
    WHERE dispatch_date > DATE_SUB('2019-06-23', INTERVAL 1 YEAR)
    GROUP BY book_id
    HAVING SUM(quantity) >= 10)
