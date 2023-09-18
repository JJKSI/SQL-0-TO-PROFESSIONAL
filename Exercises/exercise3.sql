-- Exercise - Summary Analytics (MIN, MAX, AVG, GROUP BY)
-- Exercise - Summary analytics (MIN, MAX, AVG, GROUP BY)

-- 1. How many movies were released between 2015 and 2022
-- 2. Print the max and min movie release year
-- 3. Print a year and how many movies were released in that year starting with the latest year


use movies_db;
select * from movies where release_year between 2015 and 2022;

select 
      max(release_year) as max_date,
      min(release_year) as min_date
from movies;


select release_year, count(*) as movies_count 
   from movies group by release_year order by release_year desc