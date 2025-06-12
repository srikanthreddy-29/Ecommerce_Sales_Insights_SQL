-- KPI 4: Monthly Sales Trend
-- Goal: Track total sales performance across months for trend analysis.
SELECT 
    DATE(DATE_TRUNC('month', order_purchase_timestamp)) AS month,
    SUM(oi.price) AS total_sales
FROM fact_orders o
JOIN fact_order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

