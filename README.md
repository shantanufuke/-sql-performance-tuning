# Enterprise Database Design & Optimization

## Overview
This project focuses on optimizing relational database design, indexing, and query performance for enterprise-scale applications.

## Features
- **Optimized Schema Design** → Normalized tables for efficient data storage.
- **Indexes & Query Execution Plans** → Enhanced performance and reduced response time.
- **Stored Procedures & Triggers** → Automate common database operations.
- **Database Migration** → Transitioning data from MySQL to PostgreSQL.

## Installation & Usage

### 1️⃣ Run the SQL Script in MySQL/PostgreSQL
```sh
mysql -u root -p < database_optimization.sql
```
```sh
psql -U postgres -d mydatabase -f database_optimization.sql
```

### 2️⃣ Verify Schema & Indexes
```sql
SELECT * FROM customers;
SELECT * FROM orders;
EXPLAIN ANALYZE SELECT customers.name, SUM(orders.total_amount) 
FROM customers JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customers.name ORDER BY total_spent DESC;
```

## Technologies Used
- **PostgreSQL, MySQL, SQL Server** → Database systems for relational storage.
- **SQL Indexing & Query Optimization** → Performance tuning techniques.
- **Stored Procedures & Triggers** → Automating business logic at the database level.

## Author
Shantanu Fuke
