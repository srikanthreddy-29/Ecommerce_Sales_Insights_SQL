-- KPI 17: Revenue per Order by State
-- Goal: Identify which states have the highest and lowest average revenue per order.

SELECT 
    c.customer_state,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS avg_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM fact_order_items oi
JOIN fact_orders o ON oi.order_id = o.order_id
JOIN dim_customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_revenue DESC;
