-- Exercise - Retrieve Data Using Numeric Query (BETWEEN, IN, ORDER BY, LIMIT, OFFSET)
-- Write SQL queries for the following:

-- 1. Print all movies in the order of their release year (latest first)
-- 2. All movies released in the year 2022
-- 3. Now all the movies released after 2020
-- 4. All movies after the year 2020 that have more than 8 rating
-- 5. Select all movies that are by Marvel studios and Hombale Films
-- 6. Select all THOR movies by their release year
-- 7. Select all movies that are not from Marvel Studios

use moviesdb;

select * from movies order by release_year desc;
select * from movies where release_year = 2022;
select * from movies where release_year >= 2020;
select * from movies where release_year >= 2020 and imdb_rating > 8;
select * from movies where studio in ("Marvel Studios", "Hombale Films");
select * from movies where title like "%thor%" order by release_year;
select * from movies where studio not in ("Marvel Studios");
select * from movies where studio!="marvel studios";

