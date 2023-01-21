/*
Find the Olympics with the highest number of athletes.
The Olympics game is a combination of the year and the season, and is found in the 'games' column.
Output the Olympics along with the corresponding number of athletes.

Tabels:
(olympics_athletes_events)
id:       int
name:     varchar
sex:      varchar
age:      float
height:   float
weight:   datetime
team:     varchar
noc:      varchar
games:    varchar
year:     int
season:   varchar
city:     varchar
sport:    varchar
event:    varchar
medal:    varchar
*/

SELECT games,
       COUNT(DISTINCT name) AS nu_atlets
FROM olympics_athletes_events
GROUP BY games
HAVING COUNT(DISTINCT name) = (SELECT TOP 1 COUNT(DISTINCT name)
                               FROM olympics_athletes_events
                               GROUP BY games
                               ORDER BY COUNT(DISTINCT name) DESC)
ORDER BY COUNT(DISTINCT name) DESC
