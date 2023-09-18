-- Exercise: CTE
-- Write SQL queries for the following,

-- Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit.
-- Note that all Hollywood movies have millions as a unit hence you don't need to do the unit conversion. 
--  Also, you can write this query without CTE as well but you should try to write this using CTE only


use moviesdb;

select m.title, industry, (f.revenue - f.budget) as profit from movies m
join financials f 
on m.movie_id = f.movie_id
where release_year >2000 and m.industry ="Hollywood" 
group  by m.movie_id
having profit>500
order by profit desc;



# USE OF CTE

select title, industry , release_year from movies 
where industry = "Hollywood" and release_year > 2000;

select (revenue - budget) as profit 
from financials;

with 
x 
as 
(select movie_id,title, industry , release_year from movies 
where industry = "Hollywood" and release_year > 2000),
y 
as
(select movie_id,(revenue - budget) as profit 
from financials)

select x.title , x.release_year, x.industry ,y.profit
from x 
join y 
on x.movie_id = y.movie_id
where y.profit>500;

-- THE SOLUTION GIVEN
with cte as (select title, release_year, (revenue-budget) as profit
			from movies m
			join financials f
			on m.movie_id=f.movie_id
			where release_year>2000 and industry="hollywood"
	)
	select * from cte where profit>500
