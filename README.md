# Sneaker Sales SQL Data Analysis

## Project Overview
This project involves analyzing a sneaker sales dataset using SQL queries to uncover meaningful insights about sales performance, customer behavior, product popularity, and supplier contributions. The goal is to demonstrate proficiency in SQL by performing complex queries on a multi-table relational database.

## Dataset and Database Schema
The database `sneaker_sales` consists of five related tables:

- **CUSTOMERS**: CustomerID, FirstName, LastName, Email, PhoneNumber, City, State  
- **PRODUCTS**: ProductID, ProductName, Category, UnitPrice, SupplierID  
- **SALES**: SaleID, Date, ProductID, CustomerID, Quantity, TotalAmount, SalesRepID, StoreLocation  
- **SALES_REPRESENTATIVE**: SalesRepID, FirstName, LastName, HireDate, Region  
- **SUPPLIERS**: SupplierID, SupplierName, ContactPerson, Email, PhoneNumber, Country  

## Project Structure
```
sneaker-sales-sql-analysis
├── README.md
├── SQL/
│ ├── sneaker_sales_01_sales_performance.sql
│ ├── sneaker_sales_02_customer_product_analysis.sql
│ └── sneaker_sales_03_supplier_product_performance.sql
├── ERD/
└── Datasets/
```

## Analysis Sections

### 1. Sales Performance Analysis
Includes queries that evaluate sales figures across sales representatives, store locations, product categories, and transaction volumes.

### 2. Customer and Product Analysis
Focuses on customer purchasing patterns, product popularity, customer distribution by location, and average spending behavior.

### 3. Supplier and Product Performance
Analyzes suppliers’ contributions, average product prices, product variety per supplier, and sales distribution across suppliers.

## Skills and Tools Used
- SQL (JOINS, GROUP BY, HAVING, Subqueries, Aggregations)  
- MySQL Workbench

## How to Use This Project
1. Clone this repository to your local machine.
2. Import the `sneaker_sales` database schema and populate it with data (CSV files can be found in `/Datasets` if provided).
3. Open the `.sql` files in the `/SQL` folder.
4. Run the queries in your SQL client to explore the analysis.
5. Modify or expand queries as needed for further insights.

---

Feel free to reach out if you have any questions!

---

*Project created by Sushma Sharma*
