-- EcoProductsDM developed and written by Ruchita Raghunandan
-- Written for INFO 3300 project work, Fall 2022
-- Originally written: October 8, 2022 | Last updated: October 22, 2022
-- Peer Reviewed By: Nehal Patel, Madison Cuprinski
-----------------------------------------------------------
-- Creating and selecting the database 
--
IF NOT EXISTS(SELECT * FROM sys.databases
	WHERE NAME = N'EcoProductsDM')
	CREATE DATABASE EcoProductsDM
GO 
--
USE EcoProductsDM
GO
--
-- Dropping tables
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'FactSales'
	)
	DROP TABLE FactSales;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimProduct'
	)
	DROP TABLE DimProduct;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimConsumer'
	)
	DROP TABLE DimConsumer;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimSupplier'
	)
	DROP TABLE DimSupplier;
-- 
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimDate'
	)
	DROP TABLE DimDate;
--
-- Creating tables 
--
CREATE TABLE DimDate 
	(Date_SK							INT CONSTRAINT pk_date_sk PRIMARY KEY, 
	Date								DATE,
	FullDate							NCHAR(10), 
	DayOfMonth							INT, 
	DayName								NVARCHAR(9), 
	DayOfWeek							INT, 
	DayOfWeekInMonth					INT, 
	DayOfWeekInYear						INT,
	DayOfQuarter						INT,
	DayOfYear							INT,
	WeekOfMonth							INT, 
	WeekOfQuarter						INT, 
	WeekOfYear							INT,
	Month								INT, 
	MonthName							NVARCHAR(9), 
	MonthOfQuarter						INT, 
	Quarter								NCHAR(2), 
	QuarterName							NVARCHAR(9), 
	Year								INT, 
	YearName							NCHAR(7), 
	MonthYear							NCHAR(10), 
	MMYYYY								INT,
	FirstDayOfMonth						DATE,
	LastDayOfMonth						DATE,
	FirstDayOfQuarter					DATE,
	LastDayOfQuarter					DATE,
	FirstDayOfYear						DATE,
	LastDayOfYear						DATE,
	IsHoliday							BIT, 
	IsWeekday							BIT, 
	Holiday								NVARCHAR(50), 
	Season								NVARCHAR(10) 
	);
--
CREATE TABLE DimProduct
	(Product_SK							INT IDENTITY (1,1) NOT NULL CONSTRAINT pk_product_sk PRIMARY KEY,
	Product_AK							INT NOT NULL,
	ProductName							NVARCHAR(70) NOT NULL,
	ProductCategory						NVARCHAR(40) NOT NULL,
	ProductWholesalePrice				MONEY NOT NULL,
	ProductPackageType					NVARCHAR(50) NOT NULL,
	ProductSubstrateName				NVARCHAR(50) NOT NULL --Substrate is essentially like a special raw material. Not every product uses a substrate
	);
--
CREATE TABLE DimConsumer
	(Consumer_SK						INT IDENTITY (1,1) NOT NULL CONSTRAINT pk_consumer_sk PRIMARY KEY,
	Consumer_AK							INT NOT NULL,
	ConsumerCity						NVARCHAR(40) NOT NULL,
	ConsumerState						NCHAR(2) NOT NULL,
	ConsumerZip							NVARCHAR(10) NOT NULL,
	ConsumerShippingChosen				NVARCHAR(40) NOT NULL, 
	ConsumerMemberType					NVARCHAR(20) NOT NULL, 
	ConsumerSubscriptionType			NVARCHAR(40) NOT NULL,
	StartDate							DATE NOT NULL,
	EndDate								DATE NULL
	);
--
CREATE TABLE DimSupplier
	(Supplier_SK						INT IDENTITY (1,1) NOT NULL CONSTRAINT pk_supplier_sk PRIMARY KEY,
	Supplier_AK							INT NOT NULL,
	SupplierName						NVARCHAR(50) NOT NULL,
	SupplierCity						NVARCHAR(20) NOT NULL,
	SupplierState						NCHAR(2) NOT NULL,
	SupplierZip							NVARCHAR(10) NOT NULL,
	SupplierStartDate					DATE NOT NULL,
	SupplierCertificationType			NVARCHAR(30) NOT NULL,
	StartDate							DATE NOT NULL,
	EndDate								DATE NULL
	);
--
CREATE TABLE FactSales
	(SalesOrderID_DD					INT NOT NULL, --Needed degenerate dimension to establish primary key for the fact table
	Product_SK							INT NOT NULL,
	Consumer_SK							INT NOT NULL,
	Supplier_SK							INT NOT NULL,
	OrderDateKey						INT NOT NULL,
	ShipDateKey							INT NOT NULL,
	OrderQuantity						INT,
	RetailPrice							MONEY,
	CONSTRAINT pk_fact_sales PRIMARY KEY (SalesOrderID_DD,Product_SK,Consumer_SK,Supplier_SK),
	CONSTRAINT fk_dim_product FOREIGN KEY (Product_SK) REFERENCES DimProduct(Product_SK),
	CONSTRAINT fk_dim_consumer FOREIGN KEY (Consumer_SK) REFERENCES DimConsumer(Consumer_SK),
	CONSTRAINT fk_dim_supplier FOREIGN KEY (Supplier_SK) REFERENCES DimSupplier(Supplier_SK),
	CONSTRAINT fk_order_dim_date FOREIGN KEY (OrderDateKey) REFERENCES DimDate(Date_SK),
	CONSTRAINT fk_ship_dim_date FOREIGN KEY (ShipDateKey) REFERENCES DimDate(Date_SK)
	);
