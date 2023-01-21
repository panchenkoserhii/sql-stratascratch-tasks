/*
Find the review_text that received the highest number of  'cool' votes.
Output the business name along with the review text with the highest numbef of 'cool' votes.

Tabels:
(yelp_reviews)
business_name:   varchar
review_id:       varchar
user_id:         varchar
stars:           varchar
review_date:     datetime
review_text:     varchar
funny:           int
useful:          int
cool:            int
*/

SELECT business_name,
       review_text,
       MAX(cool) AS max_cool from yelp_reviews
GROUP BY business_name,
         review_text
HAVING MAX(cool) = (SELECT TOP 1 MAX(cool) AS max_cool
                    FROM yelp_reviews
                    GROUP BY business_name,
                             review_text
                    ORDER BY MAX(cool) DESC) 
order by MAX(cool) DESC
