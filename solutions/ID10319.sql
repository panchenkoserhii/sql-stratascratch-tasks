/*
Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

Tabels:
(sf_transactions)
id:            int
created_at:    datetime
value:         int
purchase_id:   int
*/

WITH cte AS (SELECT YEAR(created_at) YYYY,
                    MONTH(created_at) MM,
                    SUM(value) value,
                    LAG(SUM(value)) OVER(ORDER BY MONTH(created_at)) previous_value
             FROM sf_transactions
             GROUP BY YEAR(created_at),
                      MONTH(created_at))

SELECT CAST(YYYY AS varchar) + '-' +
       CASE
           WHEN LEN(MM) = 1 THEN '0' + CAST(MM AS varchar)
           ELSE CAST(MM AS varchar)
           END 'YYYY-MM',
       ROUND((CAST(value as float) - previous_value)/previous_value*100, 2) revenue_diff_pct
FROM cte
