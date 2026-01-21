CREATE DATABASE retail_sales_db;

CREATE TABLE retail_sales (
    transaction_id VARCHAR(50),
    transaction_date DATE,
    customer_id VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit NUMERIC(10,2),
    total_amount NUMERIC(10,2)
);
SELECT * FROM retail_sales LIMIT 10;
COPY 
retail_sales (transaction_id, transaction_date, customer_id, gender, age, product_category, quantity, price_per_unit, total_amount)
FROM '‪C:/Users/ramek/Downloads/retail_sales_dataset.csv'
DELIMITER','
CSV HEADER;
SELECT COUNT(*) FROM retail_sales;

SELECT *FROM retail_sales
WHERE gender = 'Female';

SELECT *FROM retail_sales
WHERE age > 40;

SELECT *FROM retail_sales
ORDER BY total_amount DESC;

SELECT *FROM retail_sales
ORDER BY age DESC;

SELECT SUM(total_amount) AS total_revenue
FROM retail_sales;

SELECT AVG(total_amount) AS avg_purchase
FROM retail_sales;

SELECT COUNT(transaction_id) AS total_transactions
FROM retail_sales;

SELECT product_category,SUM(total_amount) AS category_sales
FROM retail_sales
GROUP BY product_category
ORDER BY category_sales DESC;

SELECT gender,SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY gender;

SELECT product_category,SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY product_category;

SELECT product_category,SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY product_category
HAVING SUM(total_amount) > 50000;

SELECT *FROM retail_sales
WHERE transaction_date BETWEEN '2024-01-01' AND '2024-01-31';

SELECT *FROM retail_sales
WHERE customer_id LIKE 'C%';

SELECT customer_id,SUM(total_amount) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;


