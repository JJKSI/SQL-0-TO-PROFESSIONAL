# TASK IS TO GENERATE A REPORT FOR
# TOP MARKET
# TOP PRODUCT
# TOP CUSTOMER
# USING THE NET SALES IN A GIVEN FINANCIAL YEAR

use gdb0041;
EXPLAIN analyze
select 
	fs.date,
	sum(gp.gross_price*fs.sold_quantity) as total_gross_price,
    fpre.pre_invoice_discount_pct
from fact_sales_monthly fs
join dim_date d
on 
d.calender_date = fs.date
join fact_gross_price gp
on 
gp.product_code = fs.product_code 
and 
gp.fiscal_year= d.fiscal_year
join fact_pre_invoice_deductions fpre
on 
fs.customer_code = fpre.customer_code
and 
fpre.fiscal_year= d.fiscal_year
where d.fiscal_year=2021
group by fs.date,fpre.pre_invoice_discount_pct 
;
# BASICALLY THIS QUERY TAKE LONG TIME TO RUN SO IN THE COMPANY IT IS NOT GOOD AND WE STILL HAVE NOT REACHED THE FINAL NET SALES
# SO WE HAVE TO PERFORME OPTIMIZATION OF THE QUERY FOR THE BETTER PERFORMANCE 


# FOR IMPROVING PERFORMANCE WE HAVE ADDED FISCAL_YEAR COLUMN IN FACTSALESMONTHLY SO WE DIDN'T REQUIRED TO PERFORM ANY JOIN IN OUR QUERY


# BELOW WE HAVE CREATED CTE TO FIND NET_INVOICE SALES AS WE CANNOT DIRECTLY USE THE DERIVED COLUNM IN ANY EXPRESSION
WITH cte_1 as (SELECT 
  fs.product_code, 
  fs.date, 
  p.product, 
  p.variant, 
  fs.sold_quantity, 
  round(
    gp.gross_price * fs.sold_quantity, 
    2
  ) AS total_gross_price, 
  fpre.pre_invoice_discount_pct
FROM 
  fact_sales_monthly fs 
  join dim_product p on fs.product_code = p.product_code 
  JOIN fact_gross_price gp ON gp.product_code = fs.product_code 
  AND gp.fiscal_year = fs.fiscal_year 
  JOIN fact_pre_invoice_deductions fpre ON fs.customer_code = fpre.customer_code 
  AND fpre.fiscal_year = fs.fiscal_year 
WHERE 
  fs.fiscal_year = 2021)
 select *
 ,
 total_gross_price - (total_gross_price*pre_invoice_discount_pct) AS net_invoice_sales
 from cte_1;