-- Exercise - Calculated Columns (IF, CASE, YEAR, CURYEAR)
-- Write SQL queries for the following,

-- 1. Print profit % for all the movies

use moviesdb;
select *,revenue- budget as profit, (revenue-budget)*100/budget as profit_pct  from financials;