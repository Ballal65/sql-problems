WITH dictinct_categories AS(
SELECT DISTINCT 
  product_category 
FROM 
  products)
  
, customers_and_categories AS(
SELECT DISTINCT customer_id, product_category
FROM customer_contracts
JOIN products
USING (product_id)
)

SELECT customer_id
FROM customers_and_categories
GROUP BY customer_id
HAVING COUNT(customer_id) = (SELECT COUNT(*) FROM dictinct_categories);