-- ONLINE SHOPPING SYSTEM
-- DDL SCRIPT
-- PostgreSQL

CREATE TABLE Customer (
    Customer_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Password VARCHAR(100) NOT NULL
);

CREATE TABLE Address (
    Address_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Customer_ID INT NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Category (
    Category_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Category_Name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Seller (
    Seller_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Seller_Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(15),
    Rating NUMERIC(3,2)
);

CREATE TABLE Product (
    Product_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Product_Name VARCHAR(150) NOT NULL,
    Category_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Price NUMERIC(10,2) NOT NULL CHECK (Price > 0),
    Stock_Qty INT DEFAULT 0 CHECK (Stock_Qty >= 0),
    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID),
    FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID)
);

CREATE TABLE Cart (
    Cart_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Customer_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Cart_Item (
    Cart_Item_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Cart_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (Cart_ID)
        REFERENCES Cart(Cart_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

CREATE TABLE Orders (
    Order_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Item (
    Order_Item_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

CREATE TABLE Review (
    Review_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Product_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(500),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Wishlist (
    Wishlist_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),
    UNIQUE (Customer_ID, Product_ID)
);
