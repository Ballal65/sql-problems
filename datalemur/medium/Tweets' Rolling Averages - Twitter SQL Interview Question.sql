SELECT
  user_id
  , tweet_date
  , ROUND(
  (1.0 * tweet_count 
  + COALESCE(prev_day_count,0) 
  + COALESCE(two_day_prev_count,0))/
  ((CASE WHEN tweet_count IS NULL THEN 0 ELSE 1 END)
  + (CASE WHEN prev_day_count IS NULL THEN 0 ELSE 1 END)
  + (CASE WHEN two_day_prev_count IS NULL THEN 0 ELSE 1 END))
  ,2)
FROM
  (SELECT
    user_id
    , tweet_date
    , tweet_count
    , tweet_count AS count
    , LAG(tweet_count,1)OVER(PARTITION BY user_id) AS prev_day_count
    , LAG(tweet_count,2)OVER(PARTITION BY user_id) AS two_day_prev_count
  FROM 
    tweets
  ORDER BY
    user_id, tweet_date) AS tweet_counts_and_lags
GROUP BY
  user_id
  , tweet_date
  , tweet_count
  , prev_day_count
  , two_day_prev_count
ORDER BY
  user_id, tweet_date;