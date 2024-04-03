WITH cte AS (
  SELECT
  a.artist_name,
  DENSE_RANK() OVER(ORDER BY COUNT(r.song_id) DESC) AS artist_rank
  FROM artists a
    JOIN songs s
      ON a.artist_id = s.artist_id
    JOIN global_song_rank r
      ON s.song_id = r.song_id
  WHERE r.rank <= 10
  GROUP BY a.artist_name 
)

SELECT
  *
FROM cte
WHERE artist_rank <= 5
;