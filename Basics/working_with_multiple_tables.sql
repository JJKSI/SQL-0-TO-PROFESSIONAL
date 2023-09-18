use moviesdb;

select m.title, GROUP_CONCAT(a.name) as actors 
from movies m
join movie_actor ma
on m.movie_id =  ma.movie_id
join actors a 
on ma.actor_id =  a.actor_id
GROUP BY m.movie_id;


select a.name, group_concat(m.title) as movies, count(m.title) as number_of_movies 
from 
actors a
join movie_actor ma 
on a.actor_id = ma.actor_id
join movies m
on ma.movie_id =  m.movie_id
group by a.actor_id
order by number_of_movies desc;
