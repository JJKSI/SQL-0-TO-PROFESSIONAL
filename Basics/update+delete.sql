use my_movies;

update movies
set studio="Marvels Studios",
language_id=5
where idmovies=106; 

## for multiple update we can do

update movies
set studio="TERA bhai ka studio"
where idmovies in (143,144,145,146);


#for deletion
delete from movies
where idmovies in (144,146);