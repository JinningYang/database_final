USE Group4DB

--view1--
--This view shows details of orders 
--such as product...
--DROP VIEW
DROP VIEW vwOrderDetail;
CREATE VIEW vwOrderDetail AS SELECT co.OrderID,co.OrderDate,co.TotalPrice,co.TrackingNumber,temp.ProductID,temp.[ProductName ]
From dbo.CustomerOrder co
Join 
(SELECT od.OrderID,od.OrderDetailID,wp.ProductID,wp.[ProductName ]
From dbo.[OrderDetail ] od
Join dbo.WarehouseProduct wp
On od.ProductID=wp.ProductID
) temp
On co.OrderID = temp.OrderID;

GO

--test
select *
from vwEmployeeSalaryDetail
--Execute the following line to see the Donation View
--SELECT * FROM vwEmployeeSalaryDetail;

--view2--
--This view show employee salary information 
CREATE VIEW vwEmployeeSalaryDetail AS SELECT einfo.EmployeeID,einfo.EmployeeLastName,einfo.EmployeeFirstName,temp.BaseSalary,temp.Bonus,
temp.Tax,temp1.ReimbursementID,temp1.ReceiptInfo,temp1.Price,temp2.DepositAmount

From dbo.EmployeeInfo einfo
JOIN
 (Select esalary.EmployeeID,esalary.EmployeeSalaryID, er.RevenueID,er.TotalRevenue,er.Tax,esalary.BaseSalary,esalary.Bonus,esalary.TotalSalary
 From dbo.EmployeeSalary esalary
	JOIN dbo.Revenue er
	ON er.EmployeeSalaryID=esalary.EmployeeSalaryID
 )temp
 ON temp.EmployeeID=einfo.EmployeeID
JOIN
(Select *
FROM dbo.EmployeeReimbursement ereimbusrsement)temp1
ON temp1.EmployeeID=einfo.EmployeeID
JOIN
(SELECT *
FROM dbo.EmployeeDirectDeposit edd)temp2
ON temp2.EmployeeID=einfo.EmployeeID
GO
--Execute the following line to see the Doctor's Demand View
--SELECT * FROM vwDoctorsDemandNew;

--Insert dbo.revenue
INSERT  [dbo].[Revenue]([RevenueID],[EmployeeSalaryID],[Tax],[TotalRevenue],[Date])
VALUES 
	(88901,7801,33.50,10000.3,CAST(N'2019-01-01T00:00:00.000' AS DateTime)),
	(88902,7802,23.50,12000.4,CAST(N'2020-01-01T00:00:00.000' AS DateTime))
	(88903,7803,3.50,2000.4,CAST(N'2021-01-01T10:00:00.000' AS DateTime)),
	(88904,7804,13.20,4000.7,CAST(N'2018-03-11T10:00:00.000' AS DateTime)),
	(88905,7805,33.40,6000.8,CAST(N'2020-02-01T10:00:00.000' AS DateTime)),
	(88906,7806,76.30,12030.2,CAST(N'2021-02-02T10:00:00.000' AS DateTime)),
	(88907,7807,23.56,99.6,CAST(N'2021-01-11T10:00:00.000' AS DateTime)),
	(88908,7808,67.40,4056.3,CAST(N'2020-11-07T10:00:00.000' AS DateTime)),
	(88909,7809,88.56,12123.7,CAST(N'2020-09-01T10:00:00.000' AS DateTime)),
	(88910,7810,99.7,66.4,CAST(N'2020-01-01T10:00:00.000' AS DateTime))

--insert dbo.EmployeeDirectDeposit
INSERT [dbo].[EmployeeDirectDeposit]([EmployeeID],[DepositDate],[DepositAmount])
	VALUES
	(2346,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1002),
	(2347,CAST(N'2021-01-01T00:00:00.000' AS DateTime),2000),
	(2348,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1100),
	(2349,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1121),
	(2350,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1131),
	(2351,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1109),
	(2352,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1180),
	(2353,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1700),
	(2354,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1781),
	(2355,CAST(N'2021-01-01T00:00:00.000' AS DateTime),1600)

select *
from dbo.CustomerOrder c

select *
from dbo.[WebsiteCustomerAccount ]

select *
from dbo.Revenue

--insert dbo.CustomerOrder
INSERT [dbo].[CustomerOrder]
([CustomerID],[OrderID],[RevenueID],
[BillingStreetAddress],[BillingAddressCity],[BillingAddressState],[BillingAddressZipcode],
[ShippingStreetAddress],[ShippingAddressCity],[ShippingAddressState],[ShippingAddressZipcode],
[ShippingMethods],[OrderDate],[TotalPrice],[TrackingNumber])

VALUES
(1,90001,88901,
N'55 Fruit Street',N'Boston',N'MA','02118',
'759 Chestnut Street',N'Springfield', N'MA','02119',
'car',CAST(N'2021-01-01' AS Date),10000.2,794),

(2,90002,88902,
N'20 Administration Road',N'Bridgewater',N'MA','02118',
'14 Prospect Street',N'Springfield', N'MA','02119',
'car',CAST(N'2021-01-01' AS Date),1000.2,795),

(3,90003,88903,
N'800 Washington Street',N'Boston',N'MA','02118',
'2100 Dorchester Avenue',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),100.2,796),

(4,90004,88904,
N'2100 Dorchester Avenue',N'Boston',N'MA','02118',
'2100 Dorchester Avenue',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),7900.2,797),

(5,90005,88905,
N'1153 Centre Street',N'Boston',N'MA','02118',
'2100 Dorchester Avenue',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),791.2,798),

(6,90006,88906,
N'25 Carleton Street',N'Cambridge',N'MA','02118',
'2100 Dorchester Avenue',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),791.2,799),

(7,90007,88907,
N'800 Washington Street',N'Cambridge',N'MA','02118',
N'800 Washington Street',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),791.2,800),

(8,90008,88908,
N'25 Carleton Street',N'Cambridge',N'MA','02118',
N'25 Carleton Street',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),791.2,801),

(9,90009,88909,
N'1153 Centre Street',N'Cambridge',N'MA','02118',
N'1153 Centre Street',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),91.2,802),

(10,90010,88910,
N'300 Longwood Avenue',N'Cambridge',N'MA','02118',
N'300 Longwood Avenue',N'Boston', N'MA','02118',
'car',CAST(N'2021-01-01' AS Date),91.2,803)