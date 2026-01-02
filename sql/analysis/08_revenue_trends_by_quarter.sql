SELECT
    YEAR(order_date) AS year,
    DATEPART(QUARTER, order_date) AS quarter,
    SUM(line_revenue) AS revenue
FROM fact_sales
GROUP BY YEAR(order_date), DATEPART(QUARTER, order_date)
ORDER BY year, quarter;
