-- KPI 13: Average Freight Cost by Product Category
-- Goal: Identify which product categories have the highest average freight costs to optimize shipping strategy.

SELECT 
    p.product_category,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight_cost,
    COUNT(*) AS total_items
FROM fact_order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY avg_freight_cost DESC
LIMIT 10;
