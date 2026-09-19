-- ONLINE SHOPPING SYSTEM
-- DML SCRIPT
-- PostgreSQL

INSERT INTO Customer (Name, Email, Phone, Password)
VALUES
('Ravi', 'ravi@gmail.com', '9876543210', 'ravi123'),
('Priya', 'priya@gmail.com', '9876543211', 'priya123'),
('Rahul', 'rahul@gmail.com', '9876543212', 'rahul123');


INSERT INTO Address (Customer_ID, City, State, Pincode)
VALUES
(1, 'Kakinada', 'Andhra Pradesh', '533001'),
(2, 'Vijayawada', 'Andhra Pradesh', '520001'),
(3, 'Hyderabad', 'Telangana', '500001');


INSERT INTO Category (Category_Name)
VALUES
('Electronics'),
('Clothing'),
('Books');


INSERT INTO Seller (Seller_Name, Contact, Rating)
VALUES
('ABC Electronics', '9876500001', 4.50),
('Fashion Store', '9876500002', 4.20),
('Book World', '9876500003', 4.70);


INSERT INTO Product
(Product_Name, Category_ID, Seller_ID, Price, Stock_Qty)
VALUES
('Wireless Mouse', 1, 1, 699.00, 150),
('Men Cotton T-Shirt', 2, 2, 499.00, 300),
('Programming Book', 3, 3, 799.00, 100),
('Wireless Keyboard', 1, 1, 999.00, 80);


INSERT INTO Cart (Customer_ID)
VALUES
(1),
(2),
(3);


INSERT INTO Cart_Item (Cart_ID, Product_ID, Quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1);


INSERT INTO Orders (Customer_ID, Order_Date, Status)
VALUES
(1, '2026-09-18', 'Completed'),
(2, '2026-09-18', 'Pending'),
(3, '2026-09-19', 'Completed');


INSERT INTO Order_Item (Order_ID, Product_ID, Quantity)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1);


INSERT INTO Review
(Product_ID, Customer_ID, Rating, Comment)
VALUES
(1, 1, 5, 'Good product'),
(2, 1, 4, 'Good quality'),
(3, 2, 5, 'Very useful book');


INSERT INTO Wishlist (Customer_ID, Product_ID)
VALUES
(1, 3),
(2, 1),
(3, 2);
