use moviesdb;

select 
m.movie_id, m.title, budget, revenue, currency , unit
from movies m
left join financials f
on m.movie_id = f.movie_id
union
select 
f.movie_id, m.title, budget, revenue, currency , unit
from movies m
right join financials f
on m.movie_id = f.movie_id;

-- use of using clause instead of on clause in joins
select 
movie_id, title, budget, revenue, currency , unit
from movies m 
join financials f 
using (movie_id);