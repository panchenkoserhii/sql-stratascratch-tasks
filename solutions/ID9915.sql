/*
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
If customer had more than one order on a certain day, sum the order costs on daily basis.
Output customer's first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique.

Tabels:
(customers)
id:                 int
first_name:         varchar
last_name:          varchar
city:               varchar
address:            varchar
phone_number:       varchar

(orders)
id:                 int
cust_id:            int
order_date:         datetime
order_details:      varchar
total_order_cost:   int
*/

WITH a AS (SELECT c.first_name,
           o.order_date,
           SUM(total_order_cost) AS day_order_cost
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.cust_id
WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY c.id,
         c.first_name,
         o.order_date)

SELECT *
FROM a
WHERE day_order_cost = (SELECT MAX(day_order_cost)
                        FROM a)
