-- Exercise - Retrieve Data Using Text Query (SELECT, WHERE, DISTINCT, LIKE)
-- Write SQL queries for the following:

-- 1. Print all movie titles and release year for all Marvel Studios movies.
-- 2. Print all movies that have Avenger in their name.
-- 3. Print the year when the movie "The Godfather" was released.
-- 4. Print all distinct movie studios in the Bollywood industry.

use moviesdb;
select title, release_year from movies where studio = "Marvel Studios";
select * from movies where title like "%avenger%";
select release_year from movies where title = "The Godfather";
select distinct studio from movies where industry="bollywood";