# WE ARE USING HERE THE TABLES CREATED IN VIEWS
use gdb0041;

select *
,total_gross_price - (total_gross_price*pre_invoice_discount_pct) AS net_invoice_sales,
(fpost.discounts_pct + fpost.other_deductions_pct) as post_invoice_discount
from sales_pre_invoice_discout spre
join 
fact_post_invoice_deductions fpost
on
spre.customer_code = fpost.customer_code
and
spre.product_code = fpost.product_code
and
spre.date = fpost.date
;