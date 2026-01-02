CREATE TABLE dim_product (
    product_id INT IDENTITY PRIMARY KEY,
    stock_code VARCHAR(50),
    product_name VARCHAR(255)
);

INSERT INTO dim_product (stock_code, product_name)
SELECT DISTINCT stock_code, description
FROM stg_online_retail_clean;
