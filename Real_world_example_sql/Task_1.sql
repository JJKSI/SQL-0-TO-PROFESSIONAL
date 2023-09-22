-- As a product owner i want to generate individual PRODUCT sales ( aggregated on the monthly basis at the product level) 
-- croma india customer for FYI= 2021 so that i can track indiviual product sale and run futher analysis
-- The report should contain following details
-- month
-- product name
-- varaint
-- sold_quantity
-- gross prices per item 
-- gross price total


-- transaction for croma India company
# here we are using the function made by us
--  Now how to convert the year into Fiscal year for our question add four months where the fiscal year starts from to the company 
-- select adddate('2020-09-01', Interval 4 month);  -- This is the query for fiscal year veryy imp
-- year(adddate(date,interval 4 month))=2021    -- date is converted in to years here    
USE gdb0041;

SELECT 
    fs.date,
    fs.product_code,
    p.product,
    p.variant,
    fs.sold_quantity,
    gp.gross_price, 
    ROUND(gp.gross_price * fs.sold_quantity, 2) AS total_gross_price
FROM fact_sales_monthly fs
JOIN dim_product p
ON fs.product_code = p.product_code
JOIN fact_gross_price gp
ON gp.product_code = fs.product_code
AND gp.fiscal_year = get_fiscal_year(fs.date)     
WHERE customer_code = 90002002
AND get_fiscal_year(date) = 2021        
AND get_fiscal_quarter(date) = "q4"
ORDER BY date ASC;





