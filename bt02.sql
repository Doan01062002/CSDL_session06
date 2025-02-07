use session06;

-- 2,
select o.CustomerName, o.ProductName, sum(o.quantity) as 'TatalQuantity'
from Orders o
group by o.ProductName, o.CustomerName
having sum(o.quantity) > 1;

-- 3,
select o.CustomerName, o.OrderDate, sum(o.quantity) as 'Quantity'
from Orders o
group by o.CustomerName, o.OrderDate
having sum(o.quantity) > 2;

-- 4,
select o.CustomerName, o.OrderDate, sum(o.quantity * o.Price) as 'TatalSpent'
from Orders o
group by o.CustomerName, o.OrderDate
having sum(o.quantity * o.Price) > 20000000;