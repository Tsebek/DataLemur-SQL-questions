WITH ranked_spending AS (
  SELECT
    category,
    product,
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rn
  FROM product_spend
  WHERE DATE_PART('Year', transaction_date) = 2022
  GROUP BY category,
           product
)

SELECT
  category,
  product,
  total_spend
FROM ranked_spending
WHERE rn <= 2
ORDER BY category,
         rn
;