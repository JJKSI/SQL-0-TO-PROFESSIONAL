# TASK IS TO CREATE A FORECAST ACCURACY REPORT


with cte as (
	select 
	customer_code ,
	sum(forecast_quantity - sold_quantity) as net_error,
	sum(forecast_quantity - sold_quantity)*100/sum(forecast_quantity) as net_error_percent,
	sum(abs(forecast_quantity - sold_quantity)) as absolute_net_error,
	sum(abs(forecast_quantity - sold_quantity))*100/sum(forecast_quantity) as absolute_net_error_percent
	from fact_act_est s
	where s.fiscal_year = 2021
	group by customer_code
	order by absolute_net_error_percent desc
)
select 
cte.*,
c.customer,
c.market,
if( absolute_net_error_percent > 100,0,(100-absolute_net_error_percent)) as forecast_accuracy
from cte
join dim_customer c
on c.customer_code = cte.customer_code
order by forecast_accuracy desc ;
