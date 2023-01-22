/*
Find the total number of downloads for paying and non-paying users by date.
Include only records where non-paying customers have more downloads than paying customers.
The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

Tabels:
(ms_user_dimension)
user_id:           int
acc_id:            int

(ms_acc_dimension)
acc_id:            int
paying_customer:   varchar

(ms_download_facts)
date:              datetime
user_id:           int
downloads:         int
*/

WITH cte AS (SELECT d.date,
                    SUM(CASE WHEN a.paying_customer = 'yes' THEN d.downloads ELSE 0 END) paying,
                    SUM(CASE WHEN a.paying_customer = 'no' THEN d.downloads ELSE 0 END) non_paying
FROM ms_user_dimension u
LEFT JOIN ms_acc_dimension a
ON u.acc_id = a.acc_id
LEFT JOIN ms_download_facts d
ON u.user_id = d.user_id
GROUP BY d.date)

SELECT * FROM cte
WHERE non_paying > paying
