CREATE DATABASE sql_project;
USE sql_project;

CREATE TABLE retail_sales(transactions_id INT PRIMARY KEY, 	
sale_date DATE,
sale_time TIME,
customer_id	INT,
gender VARCHAR(15),
age INT,
category VARCHAR(15),
quantiy	INT,
price_per_unit FLOAT,	
cogs FLOAT,
total_sale FLOAT
);

SELECT * FROM retail_sales;
SELECT count(*) FROM retail_sales;

SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE 
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

DELETE FROM retail_sales
WHERE
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

SELECT COUNT(*) AS total_sale FROM retail_sales; 

SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

SELECT COUNT(DISTINCT category) FROM retail_sales; 
SELECT DISTINCT category FROM retail_sales;

SELECT*FROM retail_sales;

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT * FROM retail_sales
WHERE 
category = 'clothing'
AND 
DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
AND
quantiy >= 4;

SELECT 
category, SUM(total_sale) AS net_sales,
COUNT(*) AS total_orders
FROM retail_sales
group by category;

SELECT
ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

SELECT * FROM retail_sales
WHERE total_sale > 1000;

SELECT 
category, 
gender,
COUNT(*) AS total_trans 
FROM retail_sales
GROUP 
BY category,
gender
ORDER BY 1;

SELECT * FROM
(SELECT
     year(sale_date),
     month(sale_date),
ROUND(AVG(total_sale), 2) AS avg_sale,    
RANK()OVER(PARTITION BY year(sale_date) ORDER BY AVG(total_sale) DESC) as ranks
FROM retail_sales
GROUP BY 1, 2) AS t1 
WHERE ranks = 1;

SELECT 
customer_id,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;

SELECT
     category,
     COUNT(DISTINCT customer_id) AS cnt_unique_cst
FROM retail_sales
GROUP BY category;    










