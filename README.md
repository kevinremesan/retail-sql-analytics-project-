Retail SQL Data Warehouse & Analytics Project

This project builds an end-to-end SQL analytics workflow for a transactional retail dataset, including data cleaning, staging, warehouse modelling, and business-driven analysis such as revenue trends, returns behaviour, country performance, product contribution, and customer retention.

🏗 Project Architecture

This project follows a three-layer data model:

1) Staging Layer — Data Cleaning & Validation

Used to prepare raw transactional data before loading it to the warehouse.

Key steps:

loaded raw text values into staging tables

applied TRY_CAST to safely convert:

dates

numeric fields

filtered invalid or corrupted rows

standardised customer & product values

This mirrors how raw feeds are handled in real analytics pipelines.

2) Warehouse / Star Schema Layer

Modelled using a fact–dimension structure.

Fact Table

fact_sales

line-item transaction grain

returns stored as a negative quantity / negative revenue

Dimensions

dim_customer

dim_product

dim_date

Design decisions included:

keeping returns in the fact table for financial accuracy

Analysing return behaviour separately for operational insight

ensuring each fact row represents a single transaction event

3) Analysis Layer — Business Insights in SQL

All analysis was completed using SQL queries, including:

trend analysis

returns vs demand dynamics

product performance profiling

market/country contribution

customer retention behaviour & revenue value

The focus was on drawing meaningful commercial conclusions, not just producing numbers.

📊 Key Insights & Findings
1️⃣ Revenue Trends & Seasonality

Q4 produces the highest revenue volume

Higher returns in Q4 are driven by higher sales volume, not product failure

return rates fluctuate across earlier quarters rather than peaking in Q4

👉 Peak seasonal demand is strong and operationally healthy.

2️⃣ Returns Behaviour & Operational Risk

Negative quantities represent legitimate returns/credits

Q3 2010 showed the highest return rate

Q1 2011 showed the highest return rate

Q4 was not the highest risk period

👉 Returns follow timing & post-season effects rather than systemic failure.

3️⃣ Product Performance

Top-revenue products include both:

premium-priced products

high-volume turnover items

Most products maintain stable return rates

A small subset shows disproportionately high returns

👉 These products may warrant operational or quality review.

4️⃣ Country / Market Contribution

Revenue is distributed across ~25 countries

The UK is the largest revenue contributor

UK also accounts for the highest volume of returns

outside the UK, returns do not materially impact revenue

👉 Commercial performance is UK-centric with a stable international tail.

5️⃣ Customer Retention & Value

Retention was defined carefully to avoid inflation:

Same-day multiple orders were excluded

Retention counted only customers who returned on a later day

Results:

~70% of customers are retained

Retained customers generate significantly higher revenue

Retained customers are far more valuable than one-time buyers

👉 The business is strongly driven by loyal repeat customers.
