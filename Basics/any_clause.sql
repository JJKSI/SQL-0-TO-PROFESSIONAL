# give information about actor who worked in movies with id (101,110,121)

use moviesdb;


select * from actors 
where actor_id in (
select actor_id from movie_actor where movie_id in (101,110,121)
);

#use of any clause
# same as in clause
select * from actors 
where actor_id = any  (
select actor_id from movie_actor where movie_id in (101,110,121)
);

# select all movies whose rating is greater than *any* of the marvel movie rating

select title,imdb_rating from movies 
where imdb_rating > any
(select imdb_rating from movies 
where studio= "Marvel Studios") ;














