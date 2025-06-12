-- KPI 3: Top Customer Cities by Sales
-- Goal: Discover which customer locations generate the most revenue.

SELECT 
    c.customer_city,
    c.customer_state,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM fact_order_items oi
JOIN fact_orders o ON oi.order_id = o.order_id
JOIN dim_customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_city, c.customer_state
ORDER BY total_sales DESC
LIMIT 10;

