SELECT
  AB.age_bucket,
  ROUND(SUM(CASE WHEN A.activity_type = 'send' THEN A.time_spent ELSE 0 END) 
  / (SUM(CASE WHEN A.activity_type = 'send' THEN A.time_spent ELSE 0 END) 
   + SUM(CASE WHEN A.activity_type = 'open' THEN A.time_spent ELSE 0 END)) * 100, 2) AS send_perc,
  
  ROUND(SUM(CASE WHEN A.activity_type = 'open' THEN A.time_spent ELSE 0 END) 
  / (SUM(CASE WHEN A.activity_type = 'send' THEN A.time_spent ELSE 0 END) 
   + SUM(CASE WHEN A.activity_type = 'open' THEN A.time_spent ELSE 0 END)) * 100, 2) AS open_perc
FROM
  activities A
JOIN
  age_breakdown AB 
ON  
  A.user_id = AB.user_id
WHERE
   A.activity_type IN ('send', 'open')
GROUP BY
  AB.age_bucket