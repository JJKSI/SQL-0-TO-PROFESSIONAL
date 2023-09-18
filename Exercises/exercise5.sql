-- Exercise - 
-- SQL Joins (INNER, LEFT, RIGHT, FULL)
-- Write SQL queries for the following,

 -- 1. Show all the movies with their language names
-- 2. Show all Telugu movie names (assuming you don't know the language
-- id for Telugu)
-- 3. Show the language and number of movies released in that language


select  m.language_id, m.title , l.name 
from movies m
join languages l
on m.language_id = l.language_id;

select  m.language_id, m.title , l.name 
from movies m
join languages l
on m.language_id = l.language_id
where l.name = "Telugu";

select  m.language_id, count(m.title) as the_number_of_movies , l.name 
from movies m
join languages l
on m.language_id = l.language_id
group by m.language_id
;
-- answer by sir
SELECT 
            l.name, 
            COUNT(m.movie_id) as no_movies
	FROM languages l
	LEFT JOIN movies m USING (language_id)        
	GROUP BY language_id
	ORDER BY no_movies DESC;