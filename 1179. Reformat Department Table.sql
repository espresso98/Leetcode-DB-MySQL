-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

SELECT id,
    SUM(IF(MONTH = "Jan",REVENUE,NULL)) AS Jan_Revenue,
    SUM(IF(MONTH = "Feb",REVENUE,NULL)) AS Feb_Revenue,
    SUM(IF(MONTH = "Mar",REVENUE,NULL)) AS Mar_Revenue,
    SUM(IF(MONTH = "Apr",REVENUE,NULL)) AS Apr_Revenue,
    SUM(IF(MONTH = "May",REVENUE,NULL)) AS May_Revenue,
    SUM(IF(MONTH = "Jun",REVENUE,NULL)) AS Jun_Revenue,
    SUM(IF(MONTH = "Jul",REVENUE,NULL)) AS Jul_Revenue,
    SUM(IF(MONTH = "Aug",REVENUE,NULL)) AS Aug_Revenue,
    SUM(IF(MONTH = "Sep",REVENUE,NULL)) AS Sep_Revenue,
    SUM(IF(MONTH = "Oct",REVENUE,NULL)) AS Oct_Revenue,
    SUM(IF(MONTH = "Nov",REVENUE,NULL)) AS Nov_Revenue,
    SUM(IF(MONTH = "Dec",REVENUE,NULL)) AS Dec_Revenue
FROM Department
GROUP BY id
