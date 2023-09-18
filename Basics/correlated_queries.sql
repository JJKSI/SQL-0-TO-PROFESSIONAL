# select aCTOR name,id and the total number of movies they worked in

use moviesdb;
explain analyze
select ma.actor_id, a.name, count(movie_id) as movies_count 
from movie_actor ma
join 
actors a 
on ma.actor_id = a.actor_id
group by actor_id
order by movies_count desc
;

# now sloving same problem with sub queries
# this query is called coorelated query
explain analyze
select 
	actor_id,
    name, 
	(select count(*) from movie_actor
    where actor_id=actors.actor_id) 
    as movies_count
from actors
order by movies_count desc;



-- select count(*) from movie_actor
-- where actor_id= 54;