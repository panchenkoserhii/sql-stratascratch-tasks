/*
Count the number of movies that Abigail Breslin was nominated for an oscar.

Tables:
(oscar_nominees)
year:       int
category:   varchar
nominee:    varchar
movie:      varchar
winner:     bool
id:         int
*/

SELECT nominee,
       COUNT(1) AS count_nominee
FROM oscar_nominees
GROUP BY nominee
HAVING nominee = 'Abigail Breslin'
