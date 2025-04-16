
--Confirm Your Table

select top 10* from retail_sales

-- Monthly Revenue & Order Volume
SELECT 
    FORMAT(date, 'yyyy-MM') AS year_month,
    SUM(total_amount) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM retail_sales
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY year_month;

-- Top 3 Months by Revenue
SELECT TOP 3
    FORMAT(date, 'yyyy-MM') AS year_month,
    SUM(total_amount) AS monthly_revenue
FROM retail_sales
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY monthly_revenue DESC;

--Trend in Last 6 Months
SELECT 
    FORMAT(date, 'yyyy-MM') AS year_month,
    SUM(total_amount) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM retail_sales
WHERE date BETWEEN '2023-08-01' AND '2024-01-31'
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY year_month;

--Revenue by Product Category per Month
SELECT 
    FORMAT(date, 'yyyy-MM') AS year_month,
    product_category,
    SUM(total_amount) AS revenue_per_category
FROM retail_sales
GROUP BY FORMAT(date, 'yyyy-MM'), product_category
ORDER BY year_month, revenue_per_category DESC;

--Average Order Value by Month
SELECT 
    FORMAT(date, 'yyyy-MM') AS year_month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders,
    SUM(total_amount) / COUNT(DISTINCT transaction_id) AS avg_order_value
FROM retail_sales
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY year_month;

--Handling NULLs in Amount (Optional Safety Check)
SELECT 
    FORMAT(date, 'yyyy-MM') AS year_month,
    SUM(ISNULL(total_amount, 0)) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM retail_sales
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY year_month;
