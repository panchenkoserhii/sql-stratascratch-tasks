/*
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

Tabels:
(airbnb_hosts)
host_id:       int
nationality:   varchar
gender:        varchar
age:           int

(airbnb_units)
host_id:       int
unit_id:       varchar
unit_type:     varchar
n_beds:        int
n_bedrooms:    int
country:       varchar
city:          varchar
*/

SELECT nationality,
       COUNT(DISTINCT unit_id) unit_count
FROM airbnb_hosts h
LEFT JOIN airbnb_units u
ON h.host_id = u.host_id
WHERE h.age < 30 AND
      u.unit_type LIKE 'apartment'
GROUP BY nationality
ORDER BY COUNT(DISTINCT unit_id) DESC
