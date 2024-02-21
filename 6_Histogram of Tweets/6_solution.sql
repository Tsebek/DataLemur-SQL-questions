SELECT
    qty_tweet as tweet_bucket,
    COUNT(user_id) as users_num
FROM (
    SELECT
        user_id,
        COUNT(tweet_id) as qty_tweet
    FROM tweets
    WHERE DATE_PART('Year', tweet_date) = 2022 
    GROUP BY user_id
) as t1
GROUP BY qty_tweet
ORDER BY qty_tweet
;