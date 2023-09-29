# TASK IS TO GET TOP N PRODUCTS IN EACH DIVISION BY THEIR QUANTITY SOLD
# WE WILL USE THE WINDOWS_FUNCION DENSE_RANK() FOR FINDING THE RANK
with cte_1 as (select 
	p.division,
    p.product,
    sum(fs.sold_quantity) as total_sold_quantity
from fact_sales_monthly fs
join dim_product p
on fs.product_code = p.product_code
where fs.fiscal_year =2021
group by p.division,p.product),
cte_2 as (select *,
dense_rank() over(partition by division order by total_sold_quantity desc) as dnk
from cte_1
)

select * from cte_2 
where dnk<=3;