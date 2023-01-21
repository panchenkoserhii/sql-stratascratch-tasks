/*
Find the date with the highest total energy consumption from the Meta/Facebook data centers.
Output the date along with the total energy consumption across all data centers.

Tabels:
(fb_eu_energy)
date:          datetime
consumption:   int

(fb_asia_energy)
date:          datetime
consumption:   int

(fb_na_energy)
date:          datetime
consumption:   int
*/

WITH all_centers AS (SELECT * FROM fb_eu_energy
                     UNION ALL
                     SELECT * FROM fb_asia_energy
                     UNION ALL
                     SELECT * FROM fb_na_energy),
total_consumption AS (SELECT date,
                      SUM(consumption) AS sums
                      FROM all_centers
                      FROUP BY date)    
                
SELECT * FROM total_consumption
WHERE sums = (SELECT MAX(sums)
              FROM total_consumption)
