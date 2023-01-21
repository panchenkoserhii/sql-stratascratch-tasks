/*
Find the top business categories based on the total number of reviews.
Output the category along with the total number of reviews.
Order by total reviews in descending order.

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

SELECT value,
       SUM(review_count) AS total_reviews
FROM yelp_business
CROSS APPPLY STRING_SPLIT(categories, ';')
GROUP BY value
ORDER BY SUM(review_count) DESC
