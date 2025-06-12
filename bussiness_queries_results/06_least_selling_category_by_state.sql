-- KPI 6: Least Selling Categories by State
-- Goal: Find underperforming categories in each region to help improve targeted marketing.
SELECT DISTINCT ON (c.customer_state)
    c.customer_state,
    p.product_category,
    SUM(oi.price) AS total_sales
FROM fact_order_items oi
JOIN fact_orders o ON oi.order_id = o.order_id
JOIN dim_customers c ON o.customer_id = c.customer_id
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY c.customer_state, p.product_category
ORDER BY c.customer_state, total_sales ASC;
