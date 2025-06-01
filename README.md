# E-commerce System

A simple e-commerce system built with MySQL.

## 🗃 Database Schema

Tables:
- Users (id, name, email, password, role)
- Products (id, name, description, price, stock, created_at)
- Orders (id, user_id, total_price, status, created_at)
- Order_Items (id, order_id, product_id, quantity, price)

## 🔄 Relationships

- User has many Orders
- Order has many OrderItems
- Product has many OrderItems

## 🔍 Sample Queries

- Fetching all products with more than 10 stock.
  SELECT * FROM Products WHERE stock > 10;

- Fetching all orders placed by a specific user.
  SELECT * FROM Orders WHERE user_id = 1;

-Updating product stock after an order is placed.
  UPDATE Products SET stock = stock - 2 WHERE id = 5;
