CREATE DATABASE CustomerDB;
USE CustomerDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(255)
);
INSERT INTO Customers (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Mumbai'),
(2, 'Bob', 'bob@gmail.com', 'Delhi'),
(3, 'Charlie', 'charlie@gmail.com', 'Pune'),
(4, 'Alice', 'alice2@gmail.com', 'Surat'),
(5, 'David', 'david@gmail.com', 'Ahmedabad');
SELECT * FROM Customers;
UPDATE Customers
SET Address = 'Bangalore'
WHERE CustomerID = 2;
DELETE FROM Customers
WHERE CustomerID = 5;
SELECT * FROM Customers
WHERE Name = 'Alice';
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2026-04-01', 1500.00),
(102, 2, '2026-04-10', 2500.00),
(103, 3, '2026-03-25', 1800.00),
(104, 1, '2026-04-15', 3200.00),
(105, 4, '2026-02-20', 900.00);
SELECT * FROM Orders
UPDATE Orders
SET TotalAmount = 3000.00
WHERE OrderID = 102;
DELETE FROM Orders
WHERE OrderID = 105;
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
SELECT 
    MAX(TotalAmount) AS Highest_Amount,
    MIN(TotalAmount) AS Lowest_Amount,
    AVG(TotalAmount) AS Average_Amount
FROM Orders;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(1, 'Mobile', 15000, 10),
(2, 'Headphones', 800, 25),
(3, 'Keyboard', 1200, 15),
(4, 'Mouse', 400, 0),
(5, 'Monitor', 7000, 5);
SELECT * FROM Products
ORDER BY Price DESC;
UPDATE Products
SET Price = 1000
WHERE ProductID = 2;
DELETE FROM Products
WHERE Stock = 0;
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
SELECT 
    MAX(Price) AS Highest_Price,
    MIN(Price) AS Lowest_Price
FROM Products;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 101, 1, 1, 1500.00),
(2, 102, 2, 2, 1600.00),
(3, 103, 3, 1, 1200.00),
(4, 104, 1, 2, 3000.00),
(5, 104, 4, 3, 1200.00);
SELECT * FROM OrderDetails
WHERE OrderID = 104;
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;
SELECT ProductID, SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;
SELECT COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 1;









