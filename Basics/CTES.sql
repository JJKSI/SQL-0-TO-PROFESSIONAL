#CTE COMMON TABLE EXPRESSION
use moviesdb;

with actors_age as (
select
name,
year(curdate()) - birth_year as age
from actors)
select name, age from 
actors_age
where age>75 and age<85;

## movies which produced 500% or more profit although their rating was less than average rating
# DIVIDE THE QUERY AND SOLVE
##  1)movies which produced 500% profit or more
## 2)rating was less than average rating

# 1st ANSWER
select *,
(revenue -  budget)*100/budget as percentage_profit
from financials
having percentage_profit >500;

#2 ND ANSWER
select * from movies 
	where imdb_rating < 
        (select avg(imdb_rating) from movies);
        
## NOW COMBINE THE ANSWERS TO FIND OUR FINAL ANSWER

## first lets try it using SUBQUERIS

select x.movie_id,x.percentage_profit, 
	   y.title, y.imdb_rating 
from (
	select *,
	(revenue -  budget)*100/budget as percentage_profit
	from financials
	having percentage_profit >500
) x
join(
	select * from movies 
	where imdb_rating < 
        (select avg(imdb_rating) from movies)
) y
on x.movie_id = y.movie_id; 


## NOW THE USE OF CTES

with 
x as (select *,
	(revenue -  budget)*100/budget as percentage_profit
	from financials
	having percentage_profit >500),
y as (select * from movies 
	where imdb_rating < 
        (select avg(imdb_rating) from movies))
select x.movie_id,x.percentage_profit, 
	   y.title, y.imdb_rating 
from x
join y 
on x.movie_id = y.movie_id; 


