# CUSTOMER AND PRODUCT ANALYSIS

/*
  File: customer_product_analysis.sql
  Description: These queries help me understand customer buying habits and product popularity. I looked at things like average spending
               per customer, popular products, repeat customers, and how suppliers are performing.
  Author: Sushma Sharma
*/


# 1. What is the average spending per customer?
SELECT AVG(total_spent) AS avg_spendings
FROM
	(SELECT SUM(TotalAmount) AS total_spent, CustomerID
	FROM sales
	GROUP BY CustomerID) AS customer_totals;
    
# 2. Which product is the most frequently purchased by customers?
SELECT pr.ProductName, COUNT(*) as purchases
FROM sales sa
JOIN products pr ON sa.ProductID = pr.ProductID
GROUP BY pr.ProductName
ORDER BY purchases DESC
LIMIT 1;

# 3. How many unique customers made purchases in each city?
SELECT city, COUNT(DISTINCT(CustomerID)) AS unique_customers
FROM customers
GROUP BY city;

# 4. What is the distribution of product categories purchased by customers?
SELECT p.category, SUM(s.TotalAmount) AS total_sales_amount
FROM sales s
JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.category;

# 5. How many repeat customers are there in the dataset?
SELECT COUNT(*) AS repeat_customers
FROM(
		SELECT COUNT(customerID)AS repeat_customers, customerID
		FROM sales
		GROUP BY customerID
		HAVING COUNT(customerID) >= 2
        ) AS sub;

# 6. What is the average unit price of products purchased by customers?
SELECT AVG(unitPrice)
FROM products pr 
JOIN sales s  ON pr.productID = s.productID;

# 7. How does the spending behavior differ between customers from different states?
SELECT c.state, SUM(s.totalAmount) AS spendings
FROM sales s
JOIN customers c ON s.customerId = c.customerId
GROUP BY c.state;

# 8. Which supplier provides the most popular products?
SELECT sp.supplierName, p.productName, COUNT(s.saleID) AS total_sales
FROM products p
JOIN suppliers sp ON p.supplierID = sp.supplierID
JOIN sales s  ON s.productID = p.productID
GROUP BY sp.supplierName, p.productName
ORDER BY total_sales DESC
LIMIT 1;


# 9. What is the most common product category purchased by customers?
SELECT p.category, COUNT(s.saleID) AS total_sales
FROM sales s
JOIN products p ON s.productID = p.productID
GROUP BY category
ORDER BY total_sales DESC
LIMIT 1;


# 10. How many customers purchased more than one type of product?
SELECT COUNT(*) AS customer_pruchased_more_than_one_type_of_product
FROM (
		SELECT customerID
		FROM sales
		GROUP BY customerID
        HAVING COUNT(DISTINCT productID) > 1
        )
AS sub;