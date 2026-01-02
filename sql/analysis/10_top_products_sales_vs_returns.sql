SELECT
    p.product_name,

    SUM(CASE WHEN f.quantity > 0 THEN f.quantity END) AS sold_units,
    SUM(CASE WHEN f.quantity < 0 THEN ABS(f.quantity) END) AS returned_units,

    SUM(CASE WHEN f.quantity > 0 THEN f.line_revenue END) AS sales_revenue,
    SUM(f.line_revenue) AS net_revenue
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY net_revenue DESC;
