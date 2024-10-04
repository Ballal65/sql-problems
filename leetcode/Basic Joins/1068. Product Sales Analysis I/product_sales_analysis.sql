SELECT 
    P.product_name
    , S.year
    , S.price 
FROM
    Sales S
JOIN Product P USING (product_id);