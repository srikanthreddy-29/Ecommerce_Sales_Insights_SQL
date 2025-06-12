-- KPI 7: Customer Lifetime Value (CLTV)
-- Goal: Measure the total revenue brought in by each customer.
SELECT 
    o.customer_id,
    SUM(oi.price) AS cltv
FROM fact_orders o
JOIN fact_order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY cltv DESC;
