/*
Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.

Tabels:
(employee)
id:int
first_name:varchar
last_name:varchar
age:              int
sex:              varchar
employee_title:   varchar
department:       varchar
salary:           int
target:           int
bonus:            int
email:            varchar
city:             varchar
address:          varchar
manager_id:       int
*/

WITH a AS (SELECT *,
                  MAX(salary) OVER (PARTITION BY department) AS max_dep
           FROM employee)

SELECT department,
       first_name,
       salary
FROM a
WHERE salary = max_dep;
