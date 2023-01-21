/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

Tabels:
(airbnb_hosts)
host_id:       int
nationality:   varchar
gender:        varchar
age:           int

(airbnb_guests)
guest_id:      int
nationality:   varchar
gender:        varchar
age:           int
*/

SELECT DISTINCT host_id,
       guest_id
FROM airbnb_hosts h
LEFT JOIN airbnb_guests g
ON h.nationality = g.nationality AND h.gender = g.gender
