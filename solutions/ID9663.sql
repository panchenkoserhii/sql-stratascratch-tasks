/*

Find the most profitable company from the financial sector. Output the result along with the continent.

Tables:
(forbes_global_2010_2014)
company:         varchar
sector:          varchar
industry:        varchar
continent:       varchar
country:         varchar
marketvalue:     float
sales:           float
profits:         float
assets:          float
rank:            int
forbeswebpage:   varchar

*/

SELECT TOP 1 company, continent, max(profits) as max_profits from forbes_global_2010_2014
group by company, sector, continent
having sector = 'financials'
order by max(profits) DESC;
