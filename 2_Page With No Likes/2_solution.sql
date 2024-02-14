SELECT
  p.page_id
FROM pages p
LEFT JOIN page_likes pl
  ON p.page_id = pl.page_id
WHERE pl.page_id is NULL
ORDER BY p.page_id
;

-- SELECT
--   page_id
-- FROM pages
-- EXCEPT
-- SELECT
--   page_id
-- FROM page_likes
-- ;