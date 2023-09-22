-- AS A PRODUCT OWNER I NEED AN AGGREGATE  MONTHLY GROSS SALES FOR CROMA INDIA 
-- SO THAT i CAN TRACK HOW MUCH SALES THIS PARTICULAR CUSTOMER IN GENERATING FOR ATLIQ AND MANAGE OUR RELATIONSHIP
-- REPORT SHOULD HAVE
-- MONTH
-- TOTAL GROSS SALES AMOUNT TO CROMA INDIA THIS MONTH 
use gdb0041;

select 
	fs.date,
	sum(gp.gross_price*fs.sold_quantity) as total_gross_price
from fact_sales_monthly fs
join fact_gross_price gp
on 
gp.product_code = fs.product_code 
and 
gp.fiscal_year= get_fiscal_year(fs.date)
where fs.customer_code=90002002
group by fs.date
order by fs.date;