/*
Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

Tabels:
(worker)
worker_id:       int
first_name:      varchar
last_name:       varchar
salary:          int
joining_date:    datetime
department:      varchar

(title)
worker_ref_id:   int
worker_title:    varchar
affected_from:   datetime
*/

SELEST worker_title
FROM worker w
LEFT JOIN title t
ON w.worker_id = t.worker_ref_id
WHERE salary = (SELECT MAX(salary) FROM worker)
ORDER BY salary DESC
