-- Step 1: Create Optimized Tables (Normalization & Indexing)
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    total_amount DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_customer (customer_id)
);

-- Step 2: Stored Procedure for Order Insert
DELIMITER //
CREATE PROCEDURE InsertOrder(IN cust_id INT, IN amount DECIMAL(10,2))
BEGIN
    INSERT INTO orders (customer_id, total_amount) VALUES (cust_id, amount);
END //
DELIMITER ;

-- Step 3: Trigger to Update Customer Last Purchase
DELIMITER //
CREATE TRIGGER update_last_purchase
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE customers SET last_purchase = NOW() WHERE customer_id = NEW.customer_id;
END //
DELIMITER ;

-- Step 4: Query Optimization (Indexes & Execution Plan)
EXPLAIN ANALYZE
SELECT customers.name, SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC;
