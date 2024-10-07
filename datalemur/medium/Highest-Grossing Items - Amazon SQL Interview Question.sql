SELECT
  category
  , product
  , total_spend
FROM(
  SELECT
    category
    , product
    , SUM(spend) AS total_spend
    , DENSE_RANK()OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking
  FROM
    product_spend
  WHERE
    EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY
    category, product) AS sub
WHERE
  ranking <=2;