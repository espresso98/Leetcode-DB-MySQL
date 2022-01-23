SELECT 
ROUND(IFNULL(COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted)/
(COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) requested), 0), 2) 
AS accept_rate


-- Could you write a query to return the acceptance rate for every month?
WITH cte_friend_request AS (
    SELECT MONTH(accept_date) AS accept_month,COUNT(DISTINCT requester_id,accepter_id) AS accept_cnt
    FROM RequestAccepted 
    GROUP BY accept_month),
cte_request_accept AS (
    SELECT MONTH(request_date) AS request_month,COUNT(DISTINCT sender_id,send_to_id) AS req_cnt
    FROM FriendRequest 
    GROUP BY request_month)

SELECT accept_month, IFNULL(ROUND(accept_cnt/req_cnt,2),0) AS accept_rate 
FROM cte_request_accept 
JOIN cte_friend_request
    ON accept_month = request_month 
GROUP BY accept_month;