-- link - https://datalemur.com/questions/supercloud-customer

WITH temp_table AS (

SELECT customer_id , count(distinct product_category) as cnt
FROM customer_contracts as t1
LEFT JOIN products as t2 ON t1.product_id = t2.product_id
GROUP BY customer_id
)
SELECT customer_id
FROM temp_table
where cnt = (SELECT count(distinct product_category) from products)
