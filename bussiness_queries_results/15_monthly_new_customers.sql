-- KPI 15: Monthly New Customer Acquisition
-- Goal: Track how many new customers made their first purchase each month.

WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_purchase_timestamp) AS first_order_date
    FROM fact_orders
    GROUP BY customer_id
)

SELECT 
    DATE(DATE_TRUNC('month', first_order_date)) AS month,
    COUNT(customer_id) AS new_customers
FROM first_orders
GROUP BY month
ORDER BY month;
