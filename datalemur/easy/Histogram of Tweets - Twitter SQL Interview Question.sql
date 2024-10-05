SELECT
  user_no_of_tweets AS tweet_bucket
  , COUNT(user_no_of_tweets) AS users_num
FROM
  (SELECT
    user_id
    , COUNT(user_id) AS user_no_of_tweets
  FROM
    tweets
  WHERE
    EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY
    user_id) AS users_and_tweet_counts_in2022
GROUP BY
  user_no_of_tweets;