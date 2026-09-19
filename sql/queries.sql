-- ONLINE SHOPPING SYSTEM
-- SQL QUERIES
-- PostgreSQL


-- 1. Display all products
SELECT *
FROM Product;


-- 2. Display products with price greater than 500
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > 500;


-- 3. Display all customers
SELECT *
FROM Customer;


-- 4. Customer and their orders using JOIN
SELECT
    c.Name AS Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;


-- 5. Display products with their category
SELECT
    p.Product_Name,
    c.Category_Name,
    p.Price
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;


-- 6. Display products with seller details
SELECT
    p.Product_Name,
    s.Seller_Name,
    s.Rating
FROM Product p
JOIN Seller s
ON p.Seller_ID = s.Seller_ID;


-- 7. Count total number of orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;


-- 8. Find average product price
SELECT AVG(Price) AS Average_Product_Price
FROM Product;


-- 9. Find total stock
SELECT SUM(Stock_Qty) AS Total_Stock
FROM Product;


-- 10. Find maximum product price
SELECT MAX(Price) AS Maximum_Price
FROM Product;


-- 11. Find minimum product price
SELECT MIN(Price) AS Minimum_Price
FROM Product;


-- 12. Display products costing more than average price
SELECT Product_Name, Price
FROM Product
WHERE Price > (
    SELECT AVG(Price)
    FROM Product
);


-- 13. Count products in each category
SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Total_Products
FROM Category c
LEFT JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;


-- 14. Display completed orders
SELECT *
FROM Orders
WHERE Status = 'Completed';


-- 15. Display wishlist details
SELECT
    c.Name AS Customer_Name,
    p.Product_Name
FROM Wishlist w
JOIN Customer c
ON w.Customer_ID = c.Customer_ID
JOIN Product p
ON w.Product_ID = p.Product_ID;
