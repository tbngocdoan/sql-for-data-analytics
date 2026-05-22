-- ============================================================
-- PROJECT: Xóm Retail — Global Retail Holdings
-- TOPIC: Querying Data
-- SKILLS: SELECT, FROM, WHERE, GROUP BY, ORDER BY, 
           TOP, COUNT, COUNT DISTINCT, date filter
-- DATASET: retails (customers, products, sales, stores)
-- TOOL: SQL Server Management Studio 22 (SSMS)
-- ============================================================

--Question 1: Count total number of orders in 2021 across the entire chain
SELECT COUNT (DISTINCT order_number) AS total_orders_2021
FROM retails.sales
WHERE order_date >= '2021-01-01' 
  AND order_date < '2022-01-01'

--Question 2: List all product categories & number of SKUs in each category. Sort A->Z
SELECT
  category,
  COUNT (product_key) AS SKU
FROM retails.products
GROUP BY category
ORDER BY category ASC

--Question 3: Top 10 cities with most # of customers
SELECT TOP 10
  city,
  state,
  country,
  COUNT(customer_key) AS customer_count
FROM retails.customers
GROUP BY country, state, city
ORDER BY customer_count DESC

--Question 4: Number of stores for each country
SELECT
  country,
  COUNT (store_key) AS store_count
FROM retails.stores
WHERE country!= 'Online'
GROUP BY country
ORDER BY store_count DESC

--Question 5: 
