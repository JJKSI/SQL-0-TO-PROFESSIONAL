-- Exercise: Database Views
-- Create a view for gross sales. It should have the following columns,

-- date, fiscal_year, customer_code, customer, market, product_code, product, variant,
-- sold_quanity, gross_price_per_item, gross_price_total



-- My solution
select *,
(fs.sold_quantity * gp.gross_price) as gorss_total from fact_sales_monthly fs
join fact_gross_price gp
on
fs.product_code = gp.product_code and
fs.fiscal_year = gp.fiscal_year
join dim_product p
on 
fs.product_code = p.product_code;




-- the soultion given
	SELECT 
		s.date,
		s.fiscal_year,
		s.customer_code,
		c.customer,
		c.market,
		s.product_code,
		p.product, p.variant,
		s.sold_quantity,
		g.gross_price as gross_price_per_item,
		round(s.sold_quantity*g.gross_price,2) as gross_price_total
	from fact_sales_monthly s
	join dim_product p
	on s.product_code=p.product_code
	join dim_customer c
	on s.customer_code=c.customer_code
	join fact_gross_price g
	on g.fiscal_year=s.fiscal_year
	and g.product_code=s.product_code;