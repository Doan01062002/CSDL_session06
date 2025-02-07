use session06;

-- 2,
select min(o.price) as 'MinPrice', max(o.price) as 'MaxPrice' 
from Orders o;

-- 3,
select o.CustomerName, count(o.OrderID) as 'OrderCount'
from Orders o
group by o.CustomerName;

-- 4,
select min(o.OrderDate) as 'EarliestDate', max(o.OrderDate) as 'LatestDate'
from Orders o;