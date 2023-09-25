# REPORT INCLUDING THE TOP MARKETS  AND CUSTOMERS USING NET_SALES
# HERE WE ARE MAKING THE USE OF VIEWS


-- this was for the top market
use gdb0041;
select 
market,
round(sum(net_sales)/1000000,2) as net_sales_millions
from net_sales
where fiscal_year =2021
group  by market
order by net_sales_millions desc
limit 5
;

-- this is for the top customers
use gdb0041;
select 
customer,
round(sum(net_sales)/1000000,2) as net_sales_millions
from net_sales ns
join dim_customer c
on ns.customer_code = c.customer_code
where fiscal_year =2021
group  by c.customer
order by net_sales_millions desc
limit 5;



-- Similarly we can make or find it for top products sold using net sales



select
                 product,
                 round(sum(net_sales)/1000000,2) as net_sales_mln
            from gdb0041.net_sales
            where fiscal_year=2021
            group by product
            order by net_sales_mln desc
            limit 5;