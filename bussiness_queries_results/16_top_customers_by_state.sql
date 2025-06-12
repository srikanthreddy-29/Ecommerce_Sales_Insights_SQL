-- KPI 16: Top 5 Customers per State by Orders
-- Goal: Recognize loyal customers by region.
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.customer_state,
        COUNT(o.order_id) AS num_orders,
        ROW_NUMBER() OVER (PARTITION BY c.customer_state ORDER BY COUNT(o.order_id) DESC) AS rank
    FROM dim_customers c
    JOIN fact_orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_state
) ranked
WHERE rank <= 5;
