/*
Find the rate of processed tickets for each type.
Tables:
(facebook_complaints)
complaint_id:   int
type:           int
processed:      bool
*/

WITH a AS (SELECT *,
                  CASE
                    WHEN processed = 'TRUE' THEN 1
                    ELSE 0
                  END AS cases
FROM facebook_complaints)

SELECT type,
       SUM(CAST(cases AS float))/count(type) AS processed_rate
FROM a
GROUP BY type
