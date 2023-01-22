/*
You have a table of in-app purchases by user.
Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases.
Find the number of users that made additional in-app purchases due to the success of the marketing campaign.


The marketing campaign doesn't start until one day after the initial in-app purchase
so users that only made one or multiple purchases on the first day do not count,
nor do we count users that over time purchase only the products they purchased on the first day.

Tables:
(marketing_campaign)
user_id:      int
created_at:   datetime
product_id:   int
quantity:     int
price:        int
*/

WITH cte AS (SELECT *,
                    MIN(created_at) OVER(PARTITION BY user_id) fisrt_purchase_date,
                    MIN(created_at) OVER(PARTITION BY user_id, product_id) first_purchase_date_product    
             FROM marketing_campaign)

SELECT COUNT(DISTINCT user_id) count_user
FROM cte
WHERE fisrt_purchase_date != first_purchase_date_product
