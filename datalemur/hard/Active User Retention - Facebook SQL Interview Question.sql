SELECT
  7 AS month
  ,COUNT(user_id) monthly_active_users
FROM
   (SELECT 
      user_id
      , COUNT(user_id) AS counting
    FROM
    (
      SELECT 
        user_id
        , EXTRACT(MONTH FROM event_date) AS month
      FROM
        user_actions
      WHERE 
        EXTRACT(MONTH FROM event_date) = 6
      UNION
      SELECT 
        user_id
        , EXTRACT(MONTH FROM event_date) AS month
      FROM
        user_actions
      WHERE
        EXTRACT(MONTH FROM event_date) = 7) AS user_ids_and_months
    GROUP BY
      user_id
    HAVING
      COUNT(user_id) = 2) AS subquery;