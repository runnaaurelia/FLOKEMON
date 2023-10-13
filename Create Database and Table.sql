-- Final Project Intro DB Lab
-- GROUP 5:
-- 2502036003 - Kelly
-- 2502039926 - Maura Pramesti Prasetyo
-- 2502040190 - Muhammad Julian
-- 2540135220 - Runna Aurelia

-- Create Database and Table

CREATE DATABASE Flokemon
USE Flokemon

CREATE TABLE Staff(
    StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]') NOT NULL,
    StaffName VARCHAR(255) CHECK(LEN(StaffName) > 7),
    StaffEmail VARCHAR(255) CHECK(StaffEmail LIKE '%.com'),
    StaffPhoneNumber VARCHAR(255),
    StaffGender VARCHAR(255) CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
    StaffSalary INT
)

CREATE TABLE Customer(
    CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]') NOT NULL,
    CustomerName VARCHAR(255) CHECK(LEN(CustomerName) > 7),
    CustomerPhoneNumber VARCHAR(255),
    CustomerGender VARCHAR(255) CHECK (CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female'),
    CustomerEmail VARCHAR(255) CHECK(CustomerEmail LIKE '%.com'),
)

CREATE TABLE Supplier(
    SupplierID CHAR(5) PRIMARY KEY CHECK(SupplierID LIKE 'SU[0-9][0-9][0-9]') NOT NULL,
    SupplierName VARCHAR(255) CHECK(LEN(SupplierName) > 7),
    SupplierEmail VARCHAR(255) CHECK(SupplierEmail LIKE '%.com'),
    SupplierPhoneNumber VARCHAR(255)
)

CREATE TABLE FlokemonType(
    FlokemonTypeID CHAR(5) PRIMARY KEY CHECK(FlokemonTypeID LIKE 'FT[0-9][0-9][0-9]') NOT NULL,
    FlokemonTypeName VARCHAR(255)
)

CREATE TABLE Flokemon(
    FlokemonID CHAR(5) PRIMARY KEY CHECK(FlokemonID LIKE 'FL[0-9][0-9][0-9]') NOT NULL,
    FlokemonTypeID CHAR(5) FOREIGN KEY REFERENCES FlokemonType(FlokemonTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    FlokemonName VARCHAR(255) CHECK(LEN(FlokemonName) > 5),
    FlokemonDamage INT CHECK(FlokemonDamage >= 100),
    FlokemonPrice INT CHECK(FlokemonPrice BETWEEN 10000 AND 1000000)
)

CREATE TABLE PurchaseTransaction(
    PurchaseTransactionID CHAR(5) PRIMARY KEY CHECK(PurchaseTransactionID LIKE 'PU[0-9][0-9][0-9]') NOT NULL,
    SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseTransactionDate DATE CHECK(GETDATE() >= PurchaseTransactionDate),
)

CREATE TABLE PurchaseTransactionDetail(
    PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    FlokemonID CHAR(5) FOREIGN KEY REFERENCES Flokemon(FlokemonID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseQuantity INT CHECK(PurchaseQuantity >= 1),
)

CREATE TABLE SalesTransaction(
    SalesTransactionID CHAR(5) PRIMARY KEY CHECK(SalesTransactionID LIKE 'SA[0-9][0-9][0-9]') NOT NULL,
    StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    SalesTransactionDate DATE CHECK(GETDATE() >= SalesTransactionDate)
)

CREATE TABLE SalesTransactionDetail(
    SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    FlokemonID CHAR(5) FOREIGN KEY REFERENCES Flokemon(FlokemonID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    SalesQuantity INT CHECK(SalesQuantity >= 1),
)