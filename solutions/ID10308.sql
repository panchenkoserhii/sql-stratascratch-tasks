/*
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments.
Output just the absolute difference in salaries.

Tables:
(db_employee)
id:
int
first_name:
varchar
last_name:
varchar
salary:
int
department_id:
int

(db_dept)
id:
int
department:
varchar
*/

WITH salaries_marketing_engineering AS (SELECT d.department,
                                               MAX(e.salary) AS max_salaries
                                        FROM db_employee AS e
                                        LEFT JOIN db_dept AS d
                                        ON e.department_id = d.id
                                        GROUP BY d.department
                                        HAVING d.department IN('marketing', 'engineering'))

SELECT MAX(max_salaries) - MIN(max_salaries) as differance from salaries_marketing_engineering
