USE Group4DB

CREATE DATABASE TEST_J



--view1--
--This view shows details of orders 
--such as product...
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
--Execute the following line to see the Donation View
--SELECT * FROM vwDonorDonation;

--view2--
--This view shows all aspect about doctor's demand 
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
