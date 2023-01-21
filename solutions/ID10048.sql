/*
Find the top 5 businesses with most reviews.
Assume that each row has a unique business_id such that the total reviews for each business is listed on each row.
Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

Tabels:
(yelp_business)
business_id:    varchar
name:           varchar
neighborhood:   varchar
address:        varchar
city:           varchar
state:          varchar
postal_code:    varchar
latitude:       float
longitude:      float
stars:          float
review_count:   int
is_open:        int
categories:     varchar
*/

SELECT TOP 5 name,
       SUM(review_count) AS total_review
FROM yelp_business
GROUP BY business_id,
         name
ORDER_BY SUM(review_count) DESC
