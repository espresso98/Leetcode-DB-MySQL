--  A telecommunications company wants to invest in new countries. 
-- The company intends to invest in the countries where the average call duration of the calls 
-- in this country is strictly greater than the global average call duration.

SELECT c.name AS country
FROM Person p 
JOIN Country c ON LEFT(p.phone_number, 3) = c.country_code
JOIN Calls ci ON p.id in (ci.caller_id, ci.callee_id)
GROUP BY country
HAVING AVG(ci.duration) > (SELECT AVG(duration) FROM calls)
