/*

Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

Tables:
(playbook_events)
user_id:       int
occurred_at:   datetime
event_type:    varchar
event_name:    varchar
location:      varchar
device:        varchar

*/

SELECT device,
       event_name,
       COUNT(1) AS count_device
FROM playbook_events
GROUP BY device, event_name
HAVING device LIKE 'macbook pro'
ORDER BY COUNT(1) DESC
