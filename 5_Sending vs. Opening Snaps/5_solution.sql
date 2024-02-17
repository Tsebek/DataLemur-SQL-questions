WITH time_stats AS (
  SELECT
    ag.age_bucket,
    SUM(
      CASE
        WHEN ac.activity_type = 'send'
          THEN ac.time_spent
        ELSE 0
      END
    ) AS send_time,
    SUM(
      CASE
        WHEN ac.activity_type = 'open'
          THEN ac.time_spent
        ELSE 0
      END
    ) AS open_time,
    SUM(ac.time_spent) AS total_time
  FROM activities ac
    JOIN age_breakdown ag
      ON ac.user_id = ag.user_id
  WHERE activity_type IN ('open', 'send')
  GROUP BY age_bucket
)

SELECT
  age_bucket,
  ROUND(100.0 * send_time / total_time, 2) AS send_perc,
  ROUND(100.0 * open_time / total_time, 2) AS open_perc
FROM time_stats
;