/*
Find the number of times the words 'bull' and 'bear' occur in the contents.
We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

Tabels:
(google_file_store)
filename:   varchar
contents:   varchar
*/

SELECT 'bear' word,
        SUM(CASE WHEN contents LIKE '%[^A-Za-z]bear[^A-Za-z]%' THEN 1 ELSE 0 END) nentry
FROM google_file_store
UNION ALL
SELECT 'bull' word,
        SUM(CASE WHEN contents LIKE '%[^A-Za-z]bull[^A-Za-z]%' THEN 1 ELSE 0 END) nentry
FROM google_file_store
