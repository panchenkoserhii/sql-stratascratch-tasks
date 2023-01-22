/*
Find the popularity percentage for each user on Meta/Facebook.
The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform,
then converted into a percentage by multiplying by 100.
Output each user along with their popularity percentage.
Order records in ascending order by user id.
The 'user1' and 'user2' column are pairs of friends.

Tabels:
(facebook_friends)
user1:   int
user2:   int
*/

SELECT user1,
       (CAST(COUNT(user2) as float) / COUNT(1) over())*100 ratio
FROM (SELECT user1, user2 FROM facebook_friends
      UNION
      SELECT user2, user1 FROM facebook_friends) union_table
GROUP BY user1
