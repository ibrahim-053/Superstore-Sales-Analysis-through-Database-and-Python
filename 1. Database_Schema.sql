CREATE TABLE Customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50)
);

CREATE TABLE Geography (
    Customer_ID VARCHAR(20) REFERENCES Customers(Customer_ID),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(50),
    PRIMARY KEY(Customer_ID)
);

CREATE TABLE Products (
    Customer_ID VARCHAR(20) REFERENCES Customers(Customer_ID),
    Product_ID VARCHAR(20) PRIMARY KEY,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(150)
);

CREATE TABLE Sales (
    Product_ID VARCHAR(20) REFERENCES Products(Product_ID),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 2), 
    PRIMARY KEY(Product_ID)
);

CREATE TABLE Orders (
    Customer_ID VARCHAR(20) REFERENCES Customers(Customer_ID),
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Ship_date DATE,
    Ship_mode VARCHAR(50)
);
