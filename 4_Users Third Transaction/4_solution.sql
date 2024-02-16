WITH row_num AS (
  SELECT
    t.*,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rn
  FROM transactions t
)

SELECT
  user_id,
  spend,
  transaction_date
FROM row_num
WHERE rn = 3
;