SELECT * FROM chocolate.chocolate_sales;

-- KPI	SQL Result
-- Total Revenue
-- 1. What is the total revenue generated across the entire period?
SELECT 
    ROUND(SUM(Amount),2) AS total_revenue
FROM 
    chocolate_sales;
    
   --  2. What is the total number of chocolate units (boxes) sold?
SELECT 
    SUM(Boxes_Shipped) AS total_boxes_sold
FROM 
    chocolate_sales;

-- 3. What is the average revenue per transaction?
SELECT 
    ROUND(AVG(Amount), 2) AS average_revenue_per_transaction
FROM 
    chocolate_sales;

-- 4. What is the trend of monthly sales revenue over time?

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month_year,
    ROUND(SUM(Amount), 2) AS total_monthly_revenue
FROM 
    chocolate_sales
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m')
ORDER BY 
    month_year;
    
    
-- 5. Which chocolate product generated the highest total revenue?

SELECT 
    Product,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM 
    chocolate_sales
GROUP BY 
    Product
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- 6. Which chocolate product sold the highest quantity?
SELECT 
    Product,
    SUM(Boxes_Shipped) AS total_boxes_sold
FROM 
    chocolate_sales
GROUP BY 
    Product
ORDER BY 
    total_boxes_sold DESC
LIMIT 1;


-- 7. What is the best-selling chocolate category overall?
SELECT 
    Product,
    SUM(Boxes_Shipped) AS total_quantity
FROM 
    chocolate_sales
GROUP BY 
    Product
ORDER BY 
    total_quantity DESC
LIMIT 1;

-- 8. Which products have the highest average selling price?
-- (Selling price per box = Amount / Boxes_Shipped)

SELECT 
    Product,
    ROUND(SUM(Amount) / NULLIF(SUM(Boxes_Shipped), 0), 2) AS avg_price_per_box
FROM 
    chocolate_sales
GROUP BY 
    Product
ORDER BY 
    avg_price_per_box DESC
LIMIT 5;


-- 9. Which customer segment purchases the highest quantity of chocolates?


SELECT 
    Sales_Person,
    SUM(Boxes_Shipped) AS total_boxes
FROM 
    chocolate_sales
GROUP BY 
    Sales_Person
ORDER BY 
    total_boxes DESC
LIMIT 5;

-- 10. Which country generates the highest chocolate sales revenue?

SELECT 
    Country,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM 
    chocolate_sales
GROUP BY 
    Country
ORDER BY 
    total_revenue DESC
LIMIT 5;

-- 11. Which months see the highest chocolate sales (seasonal peaks)?
SELECT 
    MONTHNAME(Date) AS month_name,
    SUM(Amount) AS total_revenue
FROM 
    chocolate_sales
GROUP BY 
    MONTH(Date)
ORDER BY 
    total_revenue DESC;
    
-- 12. Which products have declining sales over time?
-- (Find monthly quantity trend for each product)

SELECT 
    Product,
    DATE_FORMAT(Date, '%Y-%m') AS month_year,
    SUM(Boxes_Shipped) AS total_boxes_sold
FROM 
    chocolate_sales
GROUP BY 
    Product, DATE_FORMAT(Date, '%Y-%m')
ORDER BY 
    Product, month_year;
-- (You can use this table to plot or further analyze which products are dropping)

-- 13. What is the average number of boxes shipped per transaction?

SELECT 
    ROUND(AVG(Boxes_Shipped), 2) AS avg_boxes_per_transaction
FROM 
    chocolate_sales;
-- 14. Revenue per Sales Person
SELECT 
    Sales_Person,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM 
    chocolate_sales
GROUP BY 
    Sales_Person
ORDER BY 
    total_revenue DESC;

Total Quantity Sold	Query 2
Average Revenue per Transaction	Query 3
Monthly Revenue Trend	Query 4
Top Products (by Revenue and Quantity)	Query 5 and 6
Best-Selling Month	Query 11
Revenue by Sales Person / Country	Query 9 and 10
