use gdb0041;
-- Create stored procedure that can determine the market badge based on following logiv
-- if total sold quantity > 5 million that market is considered as gold and other as silver
-- input
-- market, fiscal_year
-- output
-- market badge

select 
sum(fs.sold_quantity) as total_quantity
from fact_sales_monthly fs
join dim_customer c
on fs.customer_code = c.customer_code
where get_fiscal_year(fs.date)=2021 and c.market = "India"
group by c.market;