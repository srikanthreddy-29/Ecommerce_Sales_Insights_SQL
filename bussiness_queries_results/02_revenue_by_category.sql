-- KPI 2: Revenue by Product Category
-- Goal: Understand which product categories are generating the most revenue.
SELECT 
    product_category,
    SUM(oi.price) AS total_revenue,
    ROUND(100 * SUM(oi.price) / SUM(SUM(oi.price)) OVER (), 2) AS percentage_of_total
FROM fact_order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY product_category
ORDER BY total_revenue DESC;
