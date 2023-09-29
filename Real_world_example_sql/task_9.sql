# TASK IS AS A PRODUCT OWNER I WANT TO SEE THE REGION WISE(APAC,EU)% NET SALES BREAK DOWN BY CUSTOMERS 
# IN A RESPECTIVE REGION WE ALSO HAVE TO CREATE ITS BAR CHARTS FOR FY=2021

-- WITH cte_1 AS (
--     SELECT 
--         c.customer,
--         ROUND(SUM(ns.net_sales) / 1000000, 2) AS net_sales_millions
--     FROM net_sales ns
--     JOIN dim_customer c ON ns.customer_code = c.customer_code
--     WHERE ns.fiscal_year = 2021 
--     GROUP BY c.customer
-- )
-- SELECT 
--       *,
--     net_sales_millions * 100 / SUM(net_sales_millions) OVER (PARTITION BY c.region) AS pct
-- FROM cte_1
-- JOIN dim_customer c ON cte_1.customer = c.customer
-- order by region,net_sales_millions desc;


WITH cte_1 AS (
    SELECT 
        c.customer,
        c.region,
        ROUND(SUM(ns.net_sales) / 1000000, 2) AS net_sales_millions
    FROM net_sales ns
    JOIN dim_customer c ON ns.customer_code = c.customer_code
    WHERE ns.fiscal_year = 2021 
    GROUP BY c.customer,c.region
)
SELECT 
    *,
    net_sales_millions * 100 / SUM(net_sales_millions) OVER (PARTITION BY region) AS pct
FROM cte_1
order by region,net_sales_millions desc;