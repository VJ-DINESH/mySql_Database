CREATE DATABASE ecommerce_laravel;
USE ecommerce_laravel;

-- Users Table
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('customer', 'admin') DEFAULT 'customer'
);

-- Products Table
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10, 2),
    status ENUM('pending', 'shipped', 'delivered') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

INSERT INTO Users (name, email, password, role) VALUES
('Dinesh Vetriselvam', 'dinesh@example.com', 'hashed_password_1', 'customer'),
('Ravi Kumar', 'ravi@example.com', 'hashed_password_2', 'customer'),
('Priya Sharma', 'priya@example.com', 'hashed_password_3', 'customer'),
('Admin User', 'admin@example.com', 'hashed_password_4', 'admin'),
('Sneha Reddy', 'sneha@example.com', 'hashed_password_5', 'customer');

INSERT INTO Products (name, description, price, stock, created_at) VALUES
('Smartphone', 'Latest Android smartphone with 128GB storage.', 15999.00, 50, NOW()),
('Laptop', '15.6" FHD, 8GB RAM, 512GB SSD.', 55999.00, 30, NOW()),
('Wireless Mouse', 'Ergonomic mouse with USB receiver.', 599.00, 100, NOW()),
('Bluetooth Headphones', 'Over-ear with noise cancellation.', 2999.00, 75, NOW()),
('Smart Watch', 'Fitness tracking with heart rate monitor.', 1999.00, 25, NOW());

INSERT INTO Orders (user_id, total_price, status, created_at) VALUES
(1, 21598.00, 'pending', NOW()),
(2, 58598.00, 'shipped', NOW()),
(3, 6598.00, 'delivered', NOW());

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES

(1, 1, 1, 15999.00), -- Smartphone
(1, 3, 1, 599.00),   -- Wireless Mouse


(2, 2, 1, 55999.00), -- Laptop
(2, 4, 1, 2999.00),  -- Bluetooth Headphones


(3, 5, 2, 3998.00),  -- Smart Watch
(3, 4, 1, 2599.00);  -- Bluetooth Headphones


SELECT * FROM Products WHERE stock > 10;
SELECT * FROM Orders WHERE user_id = 1;
SELECT * FROM Products WHERE id = 5;

UPDATE Products
SET stock = stock - 2
WHERE id = 5;

