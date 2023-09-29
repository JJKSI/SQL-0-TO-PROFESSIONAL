-- Exercise: Window Functions: ROW_NUMBER, RANK, DENSE_RANK
-- Retrieve the top 2 markets in every region by their gross sales amount in FY=2021. i.e. result should look something like this,

with cte_1 as(select 
c.market,
c.region,
sum(gross_price * fs.sold_quantity) as gross_sales_mln
from fact_gross_price gp
join fact_sales_monthly fs
on gp.product_code = fs.product_code and gp.fiscal_year = fs.fiscal_year
join dim_customer c 
on fs.customer_code = c.customer_code
where fs.fiscal_year=2021
group by c.market,c.region),
cte_2 as (
select *,
dense_rank() over(partition by region order by gross_sales_mln desc) as rnk from cte_1)
select * from cte_2 
where rnk<=2;



-- the answer given 

	with cte1 as (
		select
			c.market,
			c.region,
			round(sum(gross_price_total)/1000000,2) as gross_sales_mln
			from gross_sales s
			join dim_customer c
			on c.customer_code=s.customer_code
			where fiscal_year=2021
			group by market,c.region
			order by gross_sales_mln desc
		),
		cte2 as (
			select *,
			dense_rank() over(partition by region order by gross_sales_mln desc) as drnk
			from cte1
		)
	select * from cte2 where drnk<=2
