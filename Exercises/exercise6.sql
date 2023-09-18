-- Exercise - Join More Than Two Tables
-- Write SQL queries for the following,

-- 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
-- Print movie name, revenue, currency, and unit
use moviesdb;


 select m.title, 
 case 
 when unit="Thousand" then revenue= revenue/1000
 when unit="Billions" then revenue= revenue*1000
 else revenue
 end as revenue_in_millions
 , currency,unit,l.name as langauge  from movies m
 join financials f
 on m.movie_id = f.movie_id
 join languages l 
 on m.language_id = l.language_id
 where l.name ="Hindi"
 order by revenue_in_millions desc;
 -- Solution given
 SELECT 
		title, revenue, currency, unit, 
			CASE 
					WHEN unit="Thousands" THEN ROUND(revenue/1000,2)
			WHEN unit="Billions" THEN ROUND(revenue*1000,2)
					ELSE revenue 
			END as revenue_mln
	FROM movies m
	JOIN financials f
			ON m.movie_id=f.movie_id
	JOIN languages l
			ON m.language_id=l.language_id
	WHERE l.name="Hindi"
	ORDER BY revenue_mln DESC