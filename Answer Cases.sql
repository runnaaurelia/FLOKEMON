-- Final Project Intro DB Lab
-- GROUP 5:
-- 2502036003 - Kelly
-- 2502039926 - Maura Pramesti Prasetyo
-- 2502040190 - Muhammad Julian
-- 2540135220 - Runna Aurelia

-- 10 Cases

-- 1.	Display CustomerName, StaffName, and Total Transaction (obtained from the total of sales transaction) for each customer whose name contains character �a� and transaction happened in 2020.

SELECT
    CustomerName,
    StaffName,
    [Total Transaction] = COUNT(st.SalesTransactionID)
FROM SalesTransaction st
JOIN Customer c
ON st.CustomerId = c.CustomerId
JOIN Staff s
ON st.StaffId = s.StaffId
WHERE CustomerName LIKE '%a%'
AND YEAR(SalesTransactionDate) = 2020
GROUP BY CustomerName, StaffName

-- 2.	Display FlokemonName, FlokemonTypeName, and Total Purchased Flokemon (obtained from the sum of purchased flokemon quantity) for FlokemonName length more than 5 and FlokemonTypeName Contain character 'a'.

SELECT
    FlokemonName,
    FlokemonTypeName,
    [Total Purchased Flokemon] = SUM(ptd.PurchaseQuantity)
FROM Flokemon f
JOIN FlokemonType ft
ON f.FlokemonTypeID = ft.FlokemonTypeID
JOIN PurchaseTransactionDetail ptd
ON f.FlokemonID = ptd.FlokemonID
WHERE LEN(FlokemonName) > 5
AND FlokemonTypeName LIKE '%a%'
GROUP BY FlokemonName, FlokemonTypeName

-- 3.	Display FlokemonTypeName, and Average Price (obtained from average flokemon price and start with �Rp. �), Total Sales Flokemon (obtained from the sum of sold flokemon quantity) for FlokemonTypeName start with character 'p' and have damage more than 1000. Display the data in ascending order.

SELECT
    FlokemonTypeName,
    [Average Price] = CONCAT('Rp. ', CAST(AVG(f.FlokemonPrice) AS VARCHAR)),
    [Total Sales Flokemon] = SUM(std.SalesQuantity)
FROM Flokemon f
JOIN FlokemonType ft
ON f.FlokemonTypeID = ft.FlokemonTypeID
JOIN SalesTransactionDetail std
ON f.FlokemonID = std.FlokemonID
WHERE FlokemonTypeName LIKE 'p%'
AND FlokemonDamage > 1000
GROUP BY FlokemonTypeName
ORDER BY FlokemonTypeName ASC

-- 4.	Display CustomerName, Total Transaction (obtain from the total number of different flokemon bought in one transaction), and Total Flokemon Bought (obtained from total transaction quantity of the sales transaction) for every transaction that happened in October and Total Flokemon quantity more than 10 with each customer whose name contains character �a�.

SELECT
    CustomerName,
    [Total Transaction] = COUNT(std.SalesTransactionID),
    [Total Flokemon Bought] = SUM(std.SalesQuantity)
FROM SalesTransaction st
JOIN Customer c
ON c.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std
ON st.SalesTransactionID = std.SalesTransactionID
WHERE DATENAME(MONTH, SalesTransactionDate) = 'October'
AND CustomerName LIKE '%a%'
GROUP BY CustomerName
HAVING SUM(std.SalesQuantity) > 10

-- 5.	Display SalesID, CustomerName, StaffName, and Transaction Day (obtained from the day name of transaction date) for each transaction made by staff that has above average salary (obtained from average salary of all staffs) and was done in February. (alias subquery)

SELECT
    [SalesID] = SalesTransactionID,
    CustomerName,
    StaffName,
    [Transaction Day] = DATENAME(WEEKDAY, SalesTransactionDate)
FROM SalesTransaction st
JOIN Customer c
ON st.CustomerID = c.CustomerID
JOIN Staff s
ON st.StaffID = s.StaffID,
(
    SELECT
        [Average] = AVG(s2.StaffSalary)
    FROM Staff s2
) AsAvgSalary
WHERE StaffSalary > AsAvgSalary.Average
AND DATENAME(MONTH, SalesTransactionDate) = 'February'

-- 6.	Display StaffName (obtained from upper case format of StaffName), FlokemonName, Transaction Year (obtained from the year of transaction date) for each transaction that has a transaction quantity more than the average of all the transaction quantity in 2018 and staff whose name contain character �s�. (alias subquery)

SELECT
    [StaffName] = UPPER(s.StaffName),
    f.FlokemonName,
    [Transaction Year] = YEAR(pt.PurchaseTransactionDate)
FROM Staff s
JOIN PurchaseTransaction pt
ON pt.StaffID = s.StaffID
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID
JOIN Flokemon f
ON ptd.FlokemonID = f.FlokemonID,
(
    SELECT
        [Average] = AVG(ptd2.PurchaseQuantity)
    FROM PurchaseTransactionDetail ptd2
) Asaveragequantity
WHERE ptd.PurchaseQuantity > Asaveragequantity.Average
AND s.StaffName LIKE '%s%'
AND YEAR(pt.PurchaseTransactionDate) = 2018

-- 7.	Display Transaction Date and Max Flokemon Sales (obtained from max quantity of flokemon sales transaction and ends with ' Flokemon') for each Flokemon that are sold between July and December in 2020 by staff name contain character 's'. (alias subquery)

SELECT
    [Transaction Date] = SalesTransactionDate,
    [Max Flokemon Sales] = CAST(MAX(std.SalesQuantity) AS VARCHAR) + ' Flokemon'
FROM SalesTransactionDetail std
JOIN SalesTransaction st
ON std.SalesTransactionID = st.SalesTransactionID
JOIN Staff s
ON st.StaffID = s.StaffID,
(
    SELECT
       [StaffName] = StaffName
    FROM Staff s2
    WHERE StaffName LIKE '%s%'
) AsStaffNameContainS
WHERE s.StaffName = AsStaffNameContainS.StaffName
AND DATEPART(QUARTER, SalesTransactionDate) BETWEEN 3 AND 4
AND YEAR(SalesTransactionDate) = 2020
GROUP BY SalesTransactionDate

-- 8.	Display Transaction Date and Max Flokemon Purchased (obtained from max quantity of flokemon purchase transaction and ends with ' Flokemon') for each Flokemon that are bought between January and October in 2018 by staff name contain character 'o'. (alias subquery)

SELECT
    [Transaction Date] = PurchaseTransactionDate,
    [Max Flokemon Purchased] = CAST(MAX(ptd.PurchaseQuantity) AS VARCHAR) + ' Flokemon'
FROM PurchaseTransaction pt
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID
JOIN Staff s
ON pt.StaffID = s.StaffID,
(
    SELECT
        [StaffName] = StaffName
    FROM Staff s2
    WHERE StaffName LIKE '%o%'
) AsStaffNameContainO
WHERE s.StaffName = AsStaffNameContainO.StaffName
AND MONTH(PurchaseTransactionDate) BETWEEN 1 AND 10
AND YEAR(PurchaseTransactionDate) = 2018
GROUP BY PurchaseTransactionDate

-- 9.	Create a view named PurchaseView that display SupplierName, Supplier Phone (obtained by replacing 0 in front of the phone number with '+62'), Total Transactions (obtained from total number of different flokemon bought in one transaction), Total Flokemon Bought (obtained from total of transaction quantity in Purchase transaction), and for each Supplier that has made between 1 and 5 transactions and Supplier name length less than 15.

CREATE VIEW PurchaseView
AS
SELECT
    SupplierName,
    [Supplier Phone] = REPLACE(SupplierPhoneNumber, '0', '+62'),
    [Total Transactions] = COUNT(pt.PurchaseTransactionID),
    [Total Flokemon Bought] = SUM(PurchaseQuantity)
FROM PurchaseTransaction pt
JOIN Supplier s
ON pt.SupplierID = s.SupplierID
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID
WHERE LEN(SupplierName) < 15
GROUP BY SupplierName, REPLACE(SupplierPhoneNumber, '0', '+62')
HAVING COUNT(pt.PurchaseTransactionID) BETWEEN 1 AND 5

-- 10.	Create a view named StaffSalesView that display StaffName, Total Transactions (obtained from total number of different flokemon sold in one transaction), Total Flokemon Sold (obtained from total of transaction quantity in Sales transaction), and for each staff sell more than 10 Flokemon, StaffName length less than 15. 

CREATE VIEW StaffSalesView
AS
SELECT
    s.StaffName,
    [Total Transaction] = COUNT(std.SalesTransactionID),
	[Total Flokemon Sold] = SUM(std.SalesQuantity)
FROM SalesTransactionDetail std
JOIN SalesTransaction st
ON std.SalesTransactionID = st.SalesTransactionID
JOIN Staff s
ON st.StaffID = s.StaffID
WHERE LEN(s.StaffName) < 15
GROUP BY s.StaffName
HAVING SUM(std.SalesQuantity) > 10
