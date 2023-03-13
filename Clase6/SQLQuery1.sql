
SELECT * FROM DBO.TIEMPO;
GO

select CustomerID, CompanyName, ContactName, Phone
from dbo.Customers


SELECT 
	YEAR(O.OrderDate) Anio, MONTH(O.OrderDate) Mes,
	C.CustomerID, C.CompanyName, O.OrderID, 
	CONVERT(varchar,O.OrderDate,103) OrderDate,
	P.ProductName, D.UnitPrice, D.Quantity
FROM Northwind.dbo.Customers AS C
JOIN Northwind.dbo.Orders AS O ON C.CustomerID = O.CustomerID
JOIN Northwind.dbo.[Order Details] AS D ON O.OrderID = D.OrderID
JOIN Northwind.dbo.Products AS P ON D.ProductID = P.ProductID;


select distinct year(OrderDate) anio
from Orders order by 1 desc;




