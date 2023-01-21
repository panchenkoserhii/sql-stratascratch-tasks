/*
Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

Tables:
(facebook_reactions)
poster:          int
friend:          int
reaction:        varchar
date_day:        int
post_id:         int

(facebook_posts)
post_id:         int
poster:          int
post_text:       varchar
post_keywords:   varchar
post_date:       datetime
*/

SELECT DISTINCT p.*
FROM facebook_reactions AS e
LEFT JOIN facebook_posts AS p
ON e.post_id = p.post_id
WHERE reaction = 'heart'
