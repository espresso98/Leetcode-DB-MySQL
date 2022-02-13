-- Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.
-- Performance of the Ad is measured using Click-Through Rate (CTR) 

--Solution1
SELECT ad_id, 
       IFNULL(ROUND(SUM(action='Clicked')/(SUM(action='Clicked')+SUM(action='Viewed'))*100, 2), 0) AS ctr
FROM Ads
GROUP BY ad_id 
ORDER BY ctr DESC, ad_id ASC


--Solution2
WITH cte AS ( 
    SELECT ad_id, 
           SUM(action = 'clicked') AS num_clicked, 
           SUM(action = 'viewed') AS num_viewed
    FROM Ads 
    GROUP BY ad_id
)

SELECT ad_id, 
       IFNULL(ROUND(num_clicked/(num_clicked+num_viewed)*100,2),0) AS ctr
FROM cte
ORDER BY 2 DESC, 1 ASC;


/* Input: 
Ads table:
+-------+---------+---------+
| ad_id | user_id | action  |
+-------+---------+---------+
| 1     | 1       | Clicked |
| 2     | 2       | Clicked |
| 3     | 3       | Viewed  |
| 5     | 5       | Ignored |
| 1     | 7       | Ignored |
| 2     | 7       | Viewed  |
| 3     | 5       | Clicked |
| 1     | 4       | Viewed  |
| 2     | 11      | Viewed  |
| 1     | 2       | Clicked |
+-------+---------+---------+
Output: 
+-------+-------+
| ad_id | ctr   |
+-------+-------+
| 1     | 66.67 |
| 3     | 50.00 |
| 2     | 33.33 |
| 5     | 0.00  |
+-------+-------+ */