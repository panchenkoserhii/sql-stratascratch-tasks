/*
Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

Tables:
(spotify_worldwide_daily_song_ranking)
id:          int
position:    int
trackname:   varchar
artist:      varchar
streams:     int
url:         varchar
date:        datetime
region:      varchar
*/

SELECT artist,
       COUNT(1) AS qty from spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY COUNT(1) DESC
