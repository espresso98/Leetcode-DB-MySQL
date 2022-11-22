-- Write an SQL query to report the number of users that are eligible for a discount.

CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      SELECT COUNT(DISTINCT user_id) user_cnt
      FROM Purchases
      WHERE amount >= minAmount AND time_stamp BETWEEN startDate AND endDate
  );
END