# Supplier and Product Performance

/*
  File: supplier_product_performance.sql
  Description: This file contains queries I wrote to analyze how different suppliers and their products are performing in terms of sales, 
				quantities, categories, and pricing. It helps me see which suppliers and product categories are top contributors.
  Author: Sushma Sharma
*/


# 1. What is the total sales amount for each supplier?
SELECT sp.supplierName, SUM(s.TotalAmount) 
FROM suppliers sp
JOIN products p ON sp.supplierID = p.supplierID
JOIN sales s ON p.productID = s.productID
GROUP BY sp.supplierName;

# 2. Which supplier has the highest average unit price for their products?
SELECT sp.supplierName, AVG(p.unitPrice) AS highest_unitPrice
FROM suppliers sp
JOIN products p ON sp.supplierID = p.supplierID
GROUP BY sp.supplierName
ORDER BY highest_unitPrice DESC
LIMIT 1;

# 3. How many different products are provided by each supplier?
SELECT sp.supplierName, COUNT(DISTINCT p.productID)
FROM suppliers sp
JOIN products p ON sp.supplierID = p.supplierID
GROUP BY sp.supplierName;

# 4. What is the average total sales amount for products supplied by each supplier?
SELECT p.productID, sp.supplierID, AVG(s.totalAmount) AS avg_sales_amount
FROM products p 
JOIN suppliers sp ON p.supplierID = sp.supplierID
JOIN sales s ON p.productID = s.productID
GROUP BY p.productID, sp.supplierID;

# 5. Which supplier's products have the highest total sales quantity?
SELECT sp.supplierName, p.productName, SUM(s.Quantity) AS highest_quantity
FROM products p 
JOIN suppliers sp ON p.supplierID = sp.supplierID
JOIN sales s ON p.productID = s.productID
GROUP BY p.productName, sp.supplierName
ORDER BY highest_quantity DESC
LIMIT 1;

# 6. What is the most common category of products supplied by each supplier?
SELECT category, total_quantity, supplierID 
FROM (SELECT p.category, SUM(s.quantity)AS total_quantity, sp.supplierID, 
		ROW_NUMBER() OVER (PARTITION BY sp.supplierID ORDER BY SUM(s.quantity) DESC)AS rank_num
		FROM suppliers sp 
		JOIN products p ON sp.supplierID = p.supplierID
		JOIN sales s ON p.productID = s.productID
		GROUP BY p.category, sp.supplierID
        )AS ranked
where rank_num = 1;


# 7. How does the performance of products from different suppliers compare?
SELECT sp.supplierName, p.productName, COUNT(*) AS total_sales
FROM products p 
JOIN suppliers sp ON p.supplierID = sp.supplierID
JOIN sales s ON p.productID = s.productID
GROUP BY sp.supplierName, p.productName
ORDER BY total_sales DESC;

# 8. What is the distribution of product categories provided by each supplier?
SELECT sp.supplierName, p.category, COUNT(p.productID)
FROM suppliers sp
JOIN products p ON sp.supplierID = p.supplierID
GROUP BY sp.supplierName, p.category;


# 9. How many products from each supplier are in the top 10 best-selling products?
SELECT supplierName, COUNT(*)AS total_products 
FROM (
		SELECT sp.supplierName, p.productID, COUNT(s.saleID) AS total_sales
		FROM suppliers sp
		JOIN products p ON sp.supplierID = p.supplierID
		JOIN sales s ON p.productID = s.productID
		GROUP BY sp.supplierName, p.productID
		ORDER BY total_sales DESC
		LIMIT 10)
AS sub
GROUP BY supplierName;


# 10. What is the average sales amount per product category for each supplier?
SELECT sp.supplierName, p.category, AVG(s.totalAmount)
FROM suppliers sp
JOIN products p ON sp.supplierID = p.supplierID
JOIN sales s ON p.productID = s.productID
GROUP BY sp.supplierName, p.category;






