WITH job_qty AS (
  SELECT
      company_id,
      title, 
      description,
      COUNT(job_id) as job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) as duplicate_companies
FROM job_qty
WHERE job_count > 1
;