CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
	in in_market varchar(50),
	in in_fiscal_year year,
    out out_market_badge varchar(50)

)
BEGIN
declare qty int default 0;
# retrive total quantity  for a given market and the year
	select 
		sum(fs.sold_quantity) into qty
	from fact_sales_monthly fs
	join dim_customer c
	on fs.customer_code = c.customer_code
	where 
    get_fiscal_year(fs.date)=in_fiscal_year 
    and 
    c.market = in_market
	group by c.market;
    
    # determine the market badge here 
   SET out_market_badge = IF(qty > 5000000, 'Gold', 'Silver');
    

END