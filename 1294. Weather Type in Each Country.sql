-- Write an SQL query to find the type of weather in each country for November 2019.
# Cold if the average weather_state is less than or equal 15,
# Hot if the average weather_state is greater than or equal to 25, and Warm otherwise.
SELECT country_name, 
       CASE WHEN AVG(weather_state) >= 25 THEN 'Hot'
            WHEN AVG(weather_state) <= 15 THEN 'Cold'
            ELSE 'Warm' 
       END AS weather_type
FROM Countries 
JOIN Weather
USING (country_id) 
WHERE MONTH(day) = 11
GROUP BY country_name


/* Output: 
-- +--------------+--------------+
| country_name | weather_type |
+--------------+--------------+
| USA          | Cold         |
| Australia    | Cold         |
| Peru         | Hot          |
| Morocco      | Hot          |
| China        | Warm         |
+--------------+--------------+ */