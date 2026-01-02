CREATE TABLE fact_sales (
    sales_id INT IDENTITY PRIMARY KEY,
    invoice_no VARCHAR(50),
    customer_id VARCHAR(50),
    product_id INT,
    date_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    line_revenue DECIMAL(12,2)
);
