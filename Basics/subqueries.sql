#sub queries

use moviesdb;

# THe below sub query returns a single record
select * from movies
where imdb_rating=(select max(imdb_rating) from movies)
union
select * from movies
where imdb_rating=(select min(imdb_rating) from movies);


#the below subquery returns list of values
select * from movies
where imdb_rating in (
(select max(imdb_rating) from movies), 
(select min(imdb_rating) from movies)

);



#the below subquery returns table as a value
select * from 
(
select
name,
year(curdate()) - birth_year as age
from actors
) as actors_age
where age>70 and age<85;