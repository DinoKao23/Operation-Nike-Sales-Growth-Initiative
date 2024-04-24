-- SQL file to execute data requests to aid in diagnostic analytics dashboard.


SELECT * FROM Dim_Category LIMIT 20;

SELECT * FROM Dim_Date LIMIT 20;

SELECT * FROM Dim_Department LIMIT 20;

SELECT * FROM Dim_Product LIMIT 20;

SELECT * FROM Dim_User LIMIT 20;

SELECT * FROM Fact_Transactions LIMIT 20;



-- to get info segmented by age.
SELECT 
    u.age, COUNT(u.age) AS age_count,
    SUM(t.total_revenue) AS total_revenue,
    COUNT(DISTINCT t.transaction_id) AS transaction_count,
    SUM(t.total_revenue) AS total_revenue,
    AVG(t.total_revenue) AS average_transaction_value,
    SUM(t.total_quantity_purchased) AS total_units_purchased,
    AVG(t.total_quantity_purchased) AS average_units_per_transaction
FROM Fact_Transactions t
JOIN Dim_User u ON t.user_id = u.user_id
GROUP BY u.age;



select count(user_id) from Fact_Transactions where user_id = -1;
-- to look at registered v.s. unregistred.
SELECT
  CASE
    WHEN t.user_id <> '-1' THEN 'Registered'
    ELSE 'Unregistered'
  END AS user_type,
  COUNT(DISTINCT t.transaction_id) AS transaction_count,
  SUM(t.total_revenue) AS total_revenue,
  AVG(t.total_revenue / NULLIF(t.total_quantity_purchased, 0)) AS average_revenue_per_transaction,
  SUM(t.total_quantity_purchased) AS total_units_purchased,
  CASE 
    WHEN t.user_id <> '-1' THEN COUNT(DISTINCT t.user_id) 
    ELSE 1
  END AS unique_customer_count
FROM Fact_Transactions t
GROUP BY user_type;



-- seasonal patterns by subcategory in 2018.
SELECT 
    d.month,
    c.subcategory,
    c.category,
    p.product_type,
    SUM(f.total_quantity_purchased) AS total_units_sold,
    SUM(f.total_revenue) AS total_revenue,
    AVG(f.total_revenue / NULLIF(f.total_quantity_purchased, 0)) AS average_revenue_per_unit,
    COUNT(DISTINCT f.transaction_id) AS number_of_transactions,
    SUM(CASE WHEN p.is_bestseller = 1 THEN f.total_quantity_purchased ELSE 0 END) AS bestseller_units_sold
FROM 
    Fact_Transactions f
JOIN 
    Dim_Date d ON f.date_id = d.date_id
JOIN 
    Dim_Category c ON f.subcategory_id = c.subcategory_id
JOIN 
    Dim_Product p ON f.product_id = p.product_id
WHERE 
    d.year = 2018
GROUP BY 
    d.month, c.subcategory
ORDER BY 
    d.month, total_units_sold DESC;

-- all dates.
SELECT 
    d.transaction_date,
    d.month, d.year,
    c.subcategory,
    c.category,
    p.product_type,
    SUM(f.total_quantity_purchased) AS total_units_sold,
    SUM(f.total_revenue) AS total_revenue,
    AVG(f.total_revenue / NULLIF(f.total_quantity_purchased, 0)) AS average_revenue_per_unit,
    COUNT(DISTINCT f.transaction_id) AS number_of_transactions,
    SUM(CASE WHEN p.is_bestseller = 1 THEN f.total_quantity_purchased ELSE 0 END) AS bestseller_units_sold
FROM Fact_Transactions f
JOIN Dim_Date d ON f.date_id = d.date_id
JOIN Dim_Category c ON f.subcategory_id = c.subcategory_id
JOIN Dim_Product p ON f.product_id = p.product_id
GROUP BY d.transaction_date, d.month, c.subcategory
ORDER BY d.transaction_date, d.month, total_units_sold DESC;



-- to look at product information.    
SELECT 
    p.product_id,
    p.product_name,
    p.product_type,
    p.is_bestseller,
    p.retail_price,
    p.product_size,
    p.color,
    COUNT(DISTINCT t.transaction_id) AS transaction_count,
    SUM(t.total_revenue) AS total_revenue,
    AVG(t.total_revenue / NULLIF(t.total_quantity_purchased, 0)) AS average_price_per_unit,
    SUM(t.total_quantity_purchased) AS total_units_sold,
    COUNT(DISTINCT CASE WHEN t.user_id <> '-1' THEN t.user_id END) AS unique_registered_customers,
    COUNT(DISTINCT CASE WHEN t.user_id = '-1' THEN t.transaction_id END) AS unregistered_transactions_count
FROM 
    Fact_Transactions t
JOIN 
    Dim_Product p ON t.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_name, p.product_type, p.is_bestseller, p.retail_price, p.product_size, p.color
ORDER BY 
    total_revenue DESC;

    
    
-- to look at subcategory information.
SELECT
  c.subcategory,
  c.category,
  SUM(f.total_quantity_purchased) AS total_units_sold,
  SUM(f.total_revenue) AS total_revenue,
  AVG(f.total_revenue / NULLIF(f.total_quantity_purchased, 0)) AS average_revenue_per_unit,
  COUNT(DISTINCT f.transaction_id) AS number_of_transactions,
  COUNT(DISTINCT CASE WHEN f.user_id <> '-1' THEN f.user_id END) AS unique_registered_customers,
  SUM(CASE WHEN f.user_id = '-1' THEN 1 ELSE 0 END) AS unregistered_transactions_count
FROM 
  Fact_Transactions f
JOIN 
  Dim_Category c ON f.subcategory_id = c.subcategory_id
GROUP BY 
  c.subcategory, c.category;



SELECT
  c.category,
  c.subcategory,
  COUNT(DISTINCT CASE WHEN t.user_id <> '-1' THEN t.transaction_id END) AS registered_transactions_count,
  COUNT(DISTINCT CASE WHEN t.user_id = '-1' THEN t.transaction_id END) AS unregistered_transactions_count
FROM Fact_Transactions t
JOIN Dim_Category c ON t.subcategory_id = c.subcategory_id
GROUP BY c.category, c.subcategory;