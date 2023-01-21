/*
Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.

Tables:
(dc_bikeshare_q1_2012)
duration:           varchar
duration_seconds:   int
start_time:         datetime
start_station:      varchar
start_terminal:     int
end_time:           datetime
end_station:        varchar
end_terminal:       int
bike_number:        varchar
rider_type:         varchar
id:                 int
*/

SELECT bike_number,
       MAX(end_time) AS last_used
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY bike_number
