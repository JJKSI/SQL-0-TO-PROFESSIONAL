-- Exercise: CTE, Temporary Tables
-- Write a query for the below scenario.

-- The supply chain business manager wants to see which customers’ forecast accuracy has dropped from 2020 to 2021.
-- Provide a complete report with these columns: customer_code, customer_name, market, forecast_accuracy_2020, forecast_accuracy_2021

-- HINT: You can use the query with CTE that was used to generate a forecast accuracy report in the previous chapter first for 2021 and then for 2020. 
-- Then you can use these two tables. 
-- You can temporarily cache these tables in a temporary table or another CTE and then perform the join between the two.-- 

WITH cte AS (
    SELECT 
        customer_code,
        SUM(forecast_quantity - sold_quantity) AS net_error,
        SUM(forecast_quantity - sold_quantity) * 100 / SUM(forecast_quantity) AS net_error_percent,
        SUM(ABS(forecast_quantity - sold_quantity)) AS absolute_net_error,
        SUM(ABS(forecast_quantity - sold_quantity)) * 100 / SUM(forecast_quantity) AS absolute_net_error_percent
    FROM fact_act_est
    WHERE fiscal_year = 2020
    GROUP BY customer_code
),
cte2 AS (
    SELECT 
        customer_code,
        SUM(forecast_quantity - sold_quantity) AS net_error,
        SUM(forecast_quantity - sold_quantity) * 100 / SUM(forecast_quantity) AS net_error_percent,
        SUM(ABS(forecast_quantity - sold_quantity)) AS absolute_net_error,
        SUM(ABS(forecast_quantity - sold_quantity)) * 100 / SUM(forecast_quantity) AS absolute_net_error_percent
    FROM fact_act_est
    WHERE fiscal_year = 2021
    GROUP BY customer_code
)
SELECT 
    cte.customer_code,
    c.customer,
    c.market,
    IF(cte.absolute_net_error_percent > 100, 0, (100 - cte.absolute_net_error_percent)) AS forecast_accuracy_2020,
    IF(cte2.absolute_net_error_percent > 100, 0, (100 - cte2.absolute_net_error_percent)) AS forecast_accuracy_2021
FROM cte
JOIN cte2 USING (customer_code)
JOIN dim_customer c ON c.customer_code = cte.customer_code
ORDER BY forecast_accuracy_2020 DESC, forecast_accuracy_2021 DESC;
