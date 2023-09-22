-- Exercise: Yearly Sales Report
-- Generate a yearly report for Croma India where there are two columns

-- 1. Fiscal Year
-- 2. Total Gross Sales amount In that year from Croma

select 
get_fiscal_year(date) as fiscal_year,sold_quantity
from fact_sales_monthly;

select 
get_fiscal_year(date) as fiscal_year,
sum(gp.gross_price*fs.sold_quantity) as total_gross_price
from fact_gross_price gp
join 
fact_sales_monthly fs
on
fs.product_code = gp.product_code and
gp.fiscal_year=get_fiscal_year(fs.date)
where fs.customer_code = 90002002 
group by get_fiscal_year(date);


-- The solution given

select
            get_fiscal_year(date) as fiscal_year,
            sum(round(sold_quantity*g.gross_price,2)) as yearly_sales
	from fact_sales_monthly s
	join fact_gross_price g
	on 
	    g.fiscal_year=get_fiscal_year(s.date) and
	    g.product_code=s.product_code
	where
	    customer_code=90002002
	group by get_fiscal_year(date)
	order by fiscal_year;