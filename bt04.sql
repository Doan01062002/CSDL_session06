USE session06;
-- Tạo bảng Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,  -- Khóa chính tự động tăng
    ProductName VARCHAR(100) NOT NULL,         -- Tên sản phẩm
    Category VARCHAR(50) NOT NULL,             -- Loại sản phẩm
    Price DECIMAL(10, 2) NOT NULL,             -- Giá sản phẩm
    Stock INT NOT NULL                         -- Số lượng tồn kho
);
-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (ProductName, Category, Price, Stock)
VALUES
    ('iPhone 14', 'Electronics', 1000.00, 50),
    ('MacBook Air', 'Electronics', 1200.00, 30),
    ('T-Shirt', 'Fashion', 20.00, 200),
    ('Sneakers', 'Fashion', 100.00, 100),
    ('Refrigerator', 'Appliances', 800.00, 10),
    ('Air Conditioner', 'Appliances', 600.00, 15),
    ('Laptop', 'Electronics', 1500.00, 25),
    ('Headphones', 'Electronics', 200.00, 75),
    ('Jacket', 'Fashion', 150.00, 50),
    ('Washing Machine', 'Appliances', 700.00, 8);

-- 2,
select p.ProductName, p.Category, p.Price 
from Products p 
where p.Price > (select Price from Products where ProductName = 'MacBook Air');

-- 3,
select p.ProductName, p.Category, p.Price 
from Products p
where p.Category = 'Electronics' and p.Price < (select p.Price from Products p where p.ProductName = 'Laptop');

-- 4,
select p.ProductName, p.Price, p.Stock
from Products p
where p.Stock < (select p.Stock from Products p where p.ProductName = 'T-Shirt');