/*
Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.

Tables:
(lyft_drivers)
index:           int
start_date:      datetime
end_date:        datetime
yearly_salary:   int
*/

SELECT *
FROM lyft_drivers
WHERE yearly_salary <= 30000
      AND yearly_salary >= 70000
