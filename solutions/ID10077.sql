/*
Find the average total compensation based on employee titles and gender.
Total compensation is calculated by adding both the salary and bonus of each employee.
However, not every employee receives a bonus so disregard employees without bonuses in your calculation.
Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

Tabels:
(sf_employee)
id:               int
first_name:       varchar
last_name:        varchar
age:              int
sex:              varchar
employee_title:   varchar
department:       varchar
salary:           int
target:           int
email:            varchar
city:             varchar
address:          varchar
manager_id:       int

(sf_bonus)
worker_ref_id:    int
bonus:            int
*/

SELECT employee_title,
       sex,
       AVG(e.salary + ISNULL(b.total_bonus, 0)) avg_compensation
FROM sf_employee e
LEFT JOIN (SELECT worker_ref_id,
                  SUM(bonus) total_bonus
           FROM sf_bonus
           GROUP BY worker_ref_id) b
ON e.id = b.worker_ref_id
GROUP BY employee_title,
         sex
