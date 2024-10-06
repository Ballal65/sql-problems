SELECT 
  user_id
  , spend
  , transaction_date
FROM(
  SELECT 
    user_id
    , spend
    , transaction_date
    , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rowno
  FROM transactions
  ) AS transactions_with_row_number
WHERE
  rowno = 3;
