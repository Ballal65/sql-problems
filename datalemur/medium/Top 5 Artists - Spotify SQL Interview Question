WITH artists_songs_with_ranks AS (
  SELECT
    artists.artist_name,
    COUNT(*) AS counting
  FROM
    artists 
  JOIN 
    songs ON artists.artist_id = songs.artist_id 
  JOIN 
    global_song_rank ON global_song_rank.song_id = songs.song_id
  WHERE
    global_song_rank.rank BETWEEN 1 AND 10
  GROUP BY
    artists.artist_name
),
artists_ranked AS (
  SELECT
    artist_name,
    counting,
    DENSE_RANK() OVER (ORDER BY counting DESC) AS artist_rank
  FROM
    artists_songs_with_ranks
)
SELECT
  artist_name,
  artist_rank
FROM
  artists_ranked
WHERE
  artist_rank <= 5
ORDER BY
  artist_rank, artist_name;