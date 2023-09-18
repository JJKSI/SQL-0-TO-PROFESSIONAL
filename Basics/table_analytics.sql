use moviesdb;
select m.movie_id,title, budget, revenue, currency, unit, 
case 
when unit="Thousands" then round((revenue- budget)/1000,2)
when unit="Billions" then round((revenue- budget)*1000,2)
else round(revenue-budget,2)
end as profit_million
from movies m
join financials f
on m.movie_id = f.movie_id
where industry="bollywood"
order by profit_million desc;