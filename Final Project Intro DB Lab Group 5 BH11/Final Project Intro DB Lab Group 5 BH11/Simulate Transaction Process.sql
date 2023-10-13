-- Final Project Intro DB Lab
-- GROUP 5:
-- 2502036003 - Kelly
-- 2502039926 - Maura Pramesti Prasetyo
-- 2502040190 - Muhammad Julian
-- 2540135220 - Runna Aurelia

-- Simulate Transaction Process

-- Sales Transaction Simulation
-- Customers are interested in buying flokemon and went to the Flokemon Store. They look at the details and the price of each flokemon.

SELECT
    FlokemonName,
    FlokemonTypeName,
    FlokemonDamage,
    FlokemonPrice
FROM Flokemon f
JOIN FlokemonType ft
ON f.FlokemonTypeID = ft.FlokemonTypeID
ORDER BY FlokemonName ASC

-- After awhile, they decided to buy some. They are told to fill in their personal information such as customerid, name, phone number, gender, and email in order to buy flokemon.

INSERT INTO Customer VALUES
('CU011', 'Michelle Sidik', '081263309921', 'Female', 'michelle@gmail.com')

-- Staff with the ID ST007 name Jean Grey will fill in the data needed to make a sales transaction such as SalesTransactionID, StaffID, CustomerID, SalesTransactionDate, FlokemonID, SalesQuantity.

INSERT INTO SalesTransaction VALUES
('SA016', 'ST007', 'CU011', '2020-11-09')

INSERT INTO SalesTransactionDetail VALUES
('SA016', 'FL003', 6),
('SA016', 'FL009', 5),
('SA016', 'FL002', 2)

-- Purchase Transaction Simulation
-- Staff with the ID ST006 who owns a Flokemon Store needed to order some stocks for the store from a supplier name Wulan Pratiwi with the ID SU003. The supplier then give her personal information such as supplierid, name, email, and phone number to the staff. 

SELECT
    SupplierID,
    SupplierName,
    SupplierEmail,
    SupplierPhoneNumber
FROM Supplier
WHERE SupplierID LIKE 'SU003'

-- The staff was told to give her personal information such as staffid, name, email, phone number, gender.

SELECT
    StaffID,
    StaffName,
    StaffEmail,
    StaffPhoneNumber,
    StaffGender
FROM Staff
WHERE StaffID LIKE 'ST006'

-- After ordering several flokemons, the supplier will fill in the data needed into the PurchaseTransaction table such as PurchaseTransactionID, StaffID, SupplierID, PurchaseTransactionDate, FlokemonID, PurchaseQuantity.

INSERT INTO PurchaseTransaction VALUES
('PU016', 'ST006', 'SU003', '2020-08-14')

INSERT INTO PurchaseTransactionDetail VALUES
('PU016', 'FL004', 11),
('PU016', 'FL010', 8),
('PU016', 'FL008', 5)