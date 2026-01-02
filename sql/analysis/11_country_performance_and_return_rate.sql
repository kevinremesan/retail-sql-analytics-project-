SELECT
    c.country,

    SUM(CASE WHEN quantity > 0 THEN quantity END) AS sold_units,
    SUM(CASE WHEN quantity < 0 THEN ABS(quantity) END) AS returned_units,

    CAST(SUM(CASE WHEN quantity < 0 THEN ABS(quantity) END) AS FLOAT)
        / NULLIF(SUM(CASE WHEN quantity > 0 THEN quantity END),0)
        AS return_rate_units,

    SUM(line_revenue) AS net_revenue
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.country
ORDER BY net_revenue DESC;
