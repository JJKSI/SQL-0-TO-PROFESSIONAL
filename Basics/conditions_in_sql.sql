use moviesdb;

select  name,birth_year,year(curdate())- birth_year as age
from actors;

select movie_id,
 budget,
 currency,
 revenue,
 unit,
 -- we will be using millions as the revenue
if(currency='USD',revenue*80,revenue) as revenue_inr,
case 
 when unit = "Thousands" then revenue/1000
 when unit = "Billions" then revenue*1000
 else revenue
end as revenue_million, 
revenue - budget as profit
from financials
order by profit desc;

select distinct unit from financials;