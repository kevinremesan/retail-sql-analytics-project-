SELECT
    YEAR(order_date) AS year,
    DATEPART(QUARTER, order_date) AS quarter,

    SUM(CASE WHEN quantity > 0 THEN quantity END) AS sold_units,
    SUM(CASE WHEN quantity < 0 THEN ABS(quantity) END) AS returned_units,

    CAST(SUM(CASE WHEN quantity < 0 THEN ABS(quantity) END) AS FLOAT)
        / NULLIF(SUM(CASE WHEN quantity > 0 THEN quantity END),0)
        AS return_rate_units
FROM fact_sales
GROUP BY YEAR(order_date), DATEPART(QUARTER, order_date)
ORDER BY year, quarter;
