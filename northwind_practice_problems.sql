-- Introductory Problems

Use	Northwind
GO

--1
select	*
from	Shippers

--2
select	CategoryName
,		Description
from	Categories

--3
select	FirstName
,		LastName
,		HireDate
from	Employees
where	Title	=	'Sales Representative'

--4
select	FirstName
,		LastName
,		HireDate
from	Employees
where	Title	=	'Sales Representative'
and		Country	=	'USA'

--5
select	*
from	Orders
where	EmployeeID	=	5

--6
select	SupplierID
,		ContactName
,		ContactTitle		
from	Suppliers
where	ContactTitle	!=	'Marketing Manager'	

--7
select	*
from	Products
where	ProductName	like	'%queso%'

--8
select	OrderID
,		CustomerID
,		ShipCountry
from	Orders
where	ShipCountry	=	'France'
or		ShipCountry	=	'Belgium'

--9
select	OrderID
,		CustomerID
,		ShipCountry
from	Orders
where	ShipCountry	in	('Brazil','Mexico','Venezuela','Argentina')

--10
select	FirstName
,		LastName
,		Title
,		BirthDate
from	Employees
order	by	BirthDate	

--11
select	FirstName
,		LastName
,		Title
,		convert(date,BirthDate)	as	Birthonlydate
from	Employees
order	by	Birthonlydate	

--12
select	FirstName
,		LastName
,		FirstName	+	' '	+	LastName	as	fullname
from	Employees

--13
select	OrderID
,		ProductID
,		UnitPrice
,		Quantity
,		UnitPrice	*	Quantity	as	totalprice
from	[Order Details]
order	by	OrderID
,			ProductID

--14
select	count(*)	as	totalcustomer
from	Customers

--15
select	min(OrderDate)	as	FirstOrder
from	Orders

--16
select	distinct	Country
from	Customers

--16 use group by
select	Country
from	Customers
group	by	Country

--17
select	ContactTitle
,		count(*)	as	totalContactTitle
from	Customers
group	by	ContactTitle
order	by	count(*)	desc

--18
select	ProductID
,		ProductName
,		CompanyName
from	Suppliers
inner	join	
		Products
on		Suppliers.SupplierID	=	Products.SupplierID
order	by	ProductID

--19
select	OrderID
,		convert(date,OrderDate)	as	Dateorder
,		CompanyName
from	Orders
inner	join
		Shippers
on		Orders.ShipVia	=	Shippers.ShipperID
where	OrderID	<	10300
order	by	OrderID

-- Intermediate Problems
--20
select	count(*)	as	totalproduct
,		CategoryName
from	Products
inner	join
		Categories
on		Products.CategoryID	=	Categories.CategoryID
group	by	CategoryName
order	by	count(*)	desc

--21
select	Country
,		City
,		count(*)	as totalcustomer	
from	Customers
group	by	Country
,			City	
order	by	count(*)	desc

--22
select	ProductID
,		ProductName
,		UnitsInStock
,		ReorderLevel
from	Products
where	UnitsInStock	<	ReorderLevel
order	by	ProductID

--23
select	ProductID
,		ProductName
,		UnitsInStock
,		UnitsOnOrder
,		Discontinued
,		ReorderLevel
from	Products
where	UnitsInStock	+	UnitsOnOrder	<=	ReorderLevel
and		Discontinued	=	0
order	by	ProductID

--24
select	CustomerID
,		CompanyName
,		Region
from	Customers
order	by	iif	(Region	is	null,1,0)	
,		Region

--25
select	top	3	
		ShipCountry
,		avg(Freight)	as	AverageOrder
from	Orders
group	by	ShipCountry
order	by	AverageOrder	desc

--26
select	ShipCountry
,		avg(Freight)	as	AverageOrder
from	Orders
where	year(OrderDate)	=	1997
group	by	ShipCountry
order	by	AverageOrder	desc

--27
OrderId	=	10806

--28
Select	TOP 3
		ShipCountry
,		AverageFreight = Avg(freight)
From	Orders
Where	OrderDate >=	 Dateadd(year, -1, (Select max(OrderDate) from Orders))
Group	by		ShipCountry
Order	by		AverageFreight desc

--29
select	Employees.EmployeeID
,		Employees.LastName
,		Orders.OrderID
,		Products.ProductName
,		[Order Details].Quantity
from	Employees
inner	join
		Orders
on		Employees.EmployeeID	=	Orders.EmployeeID
inner	join
		[Order Details]
on		Orders.OrderID	=	[Order Details].OrderID
inner	join	
		Products
on		[Order Details].ProductID	=	Products.ProductID
Order	by	Orders.OrderID
,			Products.ProductID

--30
Select	Customers.CustomerID
,		orders.OrderID
from	Customers
left	join
		Orders
on		Customers.CustomerID	=	Orders.CustomerID
where	orders.CustomerID	is	null

--with in 
select	CustomerID
from	Customers
where	CustomerID	not	in	(
								select	CustomerID
								from	Orders
							)	

--31
select	CustomerID
from	Customers
where	CustomerID	not	in	(
								select	CustomerID
								from	Orders
								where	EmployeeID	=	4
							)

