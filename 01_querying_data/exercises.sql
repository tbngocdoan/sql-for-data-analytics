-- ============================================================
-- TOPIC 1: QUERYING DATA
-- Dataset: Xom Retail (customers, products, sales, stores)
-- Tool: SQL Server Management Studio
-- ============================================================


-- ------------------------------------------------------------
-- SELECT & FROM
-- Retrieve all columns from the customers table
-- ------------------------------------------------------------
SELECT *
FROM customers;

-- Retrieve only specific columns from the products table
SELECT product_name, brand, category, unit_price_usd
FROM products;


-- ------------------------------------------------------------
-- WHERE
-- Filter customers from the United States only
-- ------------------------------------------------------------
SELECT name, city, state, country
FROM customers
WHERE country = 'United States';

-- Filter products with a unit price greater than 100
SELECT product_name, brand, unit_price_usd
FROM products
WHERE unit_price_usd > 100;

-- Filter sales made after January 1, 2023
SELECT order_number, order_date, quantity
FROM sales
WHERE order_date > '2023-01-01';


-- ------------------------------------------------------------
-- SELECT DISTINCT
-- Find all unique countries in the customers table
-- ------------------------------------------------------------
SELECT DISTINCT country
FROM customers;

-- Find all unique product categories
SELECT DISTINCT category
FROM products;


-- ------------------------------------------------------------
-- ORDER BY
-- List customers sorted by name alphabetically (A to Z)
-- ------------------------------------------------------------
SELECT name, city, country
FROM customers
ORDER BY name ASC;

-- List products sorted by unit price from highest to lowest
SELECT product_name, brand, unit_price_usd
FROM products
ORDER BY unit_price_usd DESC;


-- ------------------------------------------------------------
-- TOP
-- Get the top 10 most expensive products
-- ------------------------------------------------------------
SELECT TOP 10 product_name, brand, unit_price_usd
FROM products
ORDER BY unit_price_usd DESC;

-- Get the top 5 most recent sales orders
SELECT TOP 5 order_number, order_date, quantity
FROM sales
ORDER BY order_date DESC;


-- ------------------------------------------------------------
-- GROUP BY
-- Count the number of customers per country
-- ------------------------------------------------------------
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

-- Calculate total quantity sold per product
SELECT product_key, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_key;


-- ------------------------------------------------------------
-- HAVING
-- Show only countries that have more than 50 customers
-- ------------------------------------------------------------
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
HAVING COUNT(*) > 50;

-- Show products where total quantity sold exceeds 100 units
SELECT product_key, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_key
HAVING SUM(quantity) > 100;


-- ------------------------------------------------------------
-- CREATE NEW COLUMN WITH A STATIC VALUE
-- Add a static column labeling all records as 'Retail'
-- ------------------------------------------------------------
SELECT 
    order_number,
    order_date,
    quantity,
    'Retail' AS business_type
FROM sales;

-- Add a static column showing the data source
SELECT 
    name,
    city,
    country,
    'Xom Retail Dataset' AS data_source
FROM customers;


-- ------------------------------------------------------------
-- NAMING A COLUMN (Alias with AS)
-- Rename columns to be more readable
-- ------------------------------------------------------------
SELECT 
    product_name AS [Product Name],
    brand AS Brand,
    unit_cost_usd AS [Cost (USD)],
    unit_price_usd AS [Price (USD)]
FROM products;

-- Calculate profit margin and name the new calculated column
SELECT 
    product_name AS [Product Name],
    unit_price_usd AS [Price (USD)],
    unit_cost_usd AS [Cost (USD)],
    (unit_price_usd - unit_cost_usd) AS [Profit per Unit (USD)]
FROM products;
