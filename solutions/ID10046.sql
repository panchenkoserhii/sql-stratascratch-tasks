/*
Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

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

WITH cte AS (SELECT state,
                    COUNT(stars) n_businesses,
                    RANK() OVER(ORDER BY COUNT(stars) DESC) rank
FROM yelp_business
WHERE stars=5
GROUP BY state)

select * from cte
WHERE rank <=5
ORDER BY n_businesses DESC,
         state
