SELECT
    user_id,
    DATE_PART('Day', MAX(post_date) - MIN(post_date)) as days_between
FROM posts
--WHERE DATE_PART('Year', post_date) = 2021
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id) > 1
;