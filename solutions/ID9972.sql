/*
Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.

Tables:
(sf_public_salaries)
id:                 int
employeename:       varchar
jobtitle:           varchar
basepay:            float
overtimepay:        float
otherpay:           float
benefits:           float
totalpay:           float
totalpaybenefits:   float
year:               int
notes:              datetime
agency:             varchar
status:             varchar
*/

SELECT employeename,
       basepay
FROM sf_public_salaries
WHERE jobtitle LIKE '%police%' AND jobtitle LIKE '%captain%'
