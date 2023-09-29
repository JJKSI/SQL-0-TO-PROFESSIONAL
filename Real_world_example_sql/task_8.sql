# THE TASK IS TO GENERATE A BAR CHART REPORT FOR FY=2021 OF TOP 10 MARKETS BYS %NET SALES	

WITH cte_1 as 
(select 
	customer,
	round(sum(net_sales)/1000000,2) as net_sales_millions
	from net_sales ns
	join dim_customer c
	on ns.customer_code = c.customer_code
	where fiscal_year =2021 
	group  by c.customer
)
select *,net_sales_millions*100/sum(net_sales_millions) over() as pct
from cte_1
    
-- order by net_sales_millions desc
;