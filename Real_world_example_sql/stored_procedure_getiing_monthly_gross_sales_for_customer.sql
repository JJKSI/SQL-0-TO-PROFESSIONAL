CREATE DEFINER=`root`@`localhost` PROCEDURE `getting_monthly_gross_sales_for_customer`(
	in_customer_code text
)
BEGIN
	select 
		fs.date,
		sum(gp.gross_price*fs.sold_quantity) as total_gross_price
	from fact_sales_monthly fs
	join fact_gross_price gp
	on 
		gp.product_code = fs.product_code 
	and 
		gp.fiscal_year= get_fiscal_year(fs.date)
	where 
    find_in_set(fs.customer_code,in_customer_code)>0
	group by fs.date
	order by fs.date;
END