-- EcoProducts database developed and written by Ruchita Raghunandan
-- Written : April 2022 | Updated : October 2022
-- Updated database for Fall 2022 INFO 3300
-- Database being improved for data warehousing
-------------------------------------------------------------
-- Creating database
IF NOT EXISTS(SELECT * FROM sys.databases
	WHERE NAME = N'EcoProducts')
	CREATE DATABASE EcoProducts
GO
USE EcoProducts
--
-- Altering the path so the script can find the CSV files 
--
DECLARE @data_path NVARCHAR(256);
SELECT @data_path = 'C:\Users\ruchi\Documents\3240 EIM\DB Builds\EcoProductsNewOltp\';
--
-- Delete existing tables
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'OrderItem'
       )
	DROP TABLE [OrderItem];
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Order'
       )
	DROP TABLE [Order];
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'ProdCertAcq'
       )
	DROP TABLE ProdCertAcq;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'SupplierCertAcq'
       )
	DROP TABLE SupplierCertAcq;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Product'
       )
	DROP TABLE Product;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Supplier'
       )
	DROP TABLE Supplier;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Consumer'
       )
	DROP TABLE Consumer;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Substrate'
       )
	DROP TABLE Substrate;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'ProdCert'
       )
	DROP TABLE ProdCert;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Certification'
       )
	DROP TABLE Certification;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'SupplierCert'
       )
	DROP TABLE SupplierCert;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Subscription'
       )
	DROP TABLE Subscription;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'ConsumerMembership'
       )
	DROP TABLE ConsumerMembership;
--
--
-- Create tables
--
CREATE TABLE ConsumerMembership
	(ConsumerMemberCode			INT CONSTRAINT pk_consumer_member_code PRIMARY KEY,
	ConsumerMemberType			NVARCHAR(15) CONSTRAINT nn_consumer_member_type NOT NULL
	);
--
CREATE TABLE Subscription
	(SubscriptionCode			INT CONSTRAINT pk_subscription_code PRIMARY KEY,
	SubscriptionType			NVARCHAR(40) CONSTRAINT nn_subscription_type NOT NULL
	);
--
CREATE TABLE SupplierCert
	(SupplierCertID 			INT CONSTRAINT pk_supplier_cert_id PRIMARY KEY,
	SupplierCertName			NVARCHAR(90) CONSTRAINT nn_supplier_cert_name NOT NULL,
	SupplierCertCo 				NVARCHAR(80) CONSTRAINT nn_supplier_cert_co NOT NULL
	);
--
CREATE TABLE Certification
	(CertificationCode			INT CONSTRAINT pk_certification_code PRIMARY KEY,
	CertificationType			NVARCHAR(30) CONSTRAINT nn_certification_type NOT NULL
	);
--
CREATE TABLE ProdCert
	(ProdCertID 				INT CONSTRAINT pk_prod_cert_id PRIMARY KEY,
	ProdCertName				NVARCHAR(90) CONSTRAINT nn_prod_cert_name NOT NULL,
	ProdCertCo 					NVARCHAR(80) CONSTRAINT nn_prod_cert_co NOT NULL,
	ProdCertFee 				MONEY CONSTRAINT nn_prod_cert_fee NOT NULL
	);
--
CREATE TABLE Substrate
	(SubstrateID 				INT CONSTRAINT pk_substrate_id PRIMARY KEY,
	SubstrateName				NVARCHAR(50) CONSTRAINT nn_substrate_name NOT NULL,
	SubstrateCost 				MONEY CONSTRAINT nn_substrate_cost NOT NULL
	);
--
CREATE TABLE Consumer
	(ConsumerID					INT CONSTRAINT pk_consumer_id PRIMARY KEY,
	ConsumerFirstName			NVARCHAR(30) CONSTRAINT nn_consumer_first_name NOT NULL,
	ConsumerLastName			NVARCHAR(40) CONSTRAINT nn_consumer_last_name NOT NULL,
	ConsumerPhoneNo				NVARCHAR(15) CONSTRAINT nn_consumer_phone_no NOT NULL,
	ConsumerAddress				NVARCHAR(70) CONSTRAINT nn_consumer_address NOT NULL,
	ConsumerCity				NVARCHAR(30) CONSTRAINT nn_consumer_city NOT NULL,
	ConsumerState				NCHAR(2)  CONSTRAINT nn_consumer_state NOT NULL,
	ConsumerZip					NVARCHAR(10) CONSTRAINT nn_consumer_zip NOT NULL,
	ConsumerShippingChosen		NVARCHAR(40) CONSTRAINT nn_consumer_shipping_chosen NOT NULL,
	ConsumerMemberCode			INT CONSTRAINT fk_member_consumer FOREIGN KEY REFERENCES ConsumerMembership(ConsumerMemberCode),
	SubscriptionCode			INT CONSTRAINT fk_subscription_consumer FOREIGN KEY REFERENCES Subscription(SubscriptionCode)
	);
--
CREATE TABLE Supplier
	(SupplierID					INT CONSTRAINT pk_supplier_id PRIMARY KEY,
	SupplierName				NVARCHAR(50) CONSTRAINT nn_supplier_name NOT NULL,
	SupplierLocation			NVARCHAR(60) CONSTRAINT nn_supplier_address NOT NULL,
	SupplierPhoneNo				NVARCHAR(15) CONSTRAINT nn_supplier_phone_no NOT NULL,
	SupplierCity				NVARCHAR(20) CONSTRAINT nn_supplier_city NOT NULL,
	SupplierState				NCHAR(2)  CONSTRAINT nn_supplier_state NOT NULL,
	SupplierStartDate			DATE CONSTRAINT nn_supplier_start_date NOT NULL,
	SupplierZip					NVARCHAR(10) CONSTRAINT nn_supplier_zip NOT NULL,
	CertificationCode			INT CONSTRAINT fk_certification_supplier FOREIGN KEY REFERENCES Certification(CertificationCode)
	);
--	
CREATE TABLE Product
	(ProductID 					INT CONSTRAINT pk_product_id PRIMARY KEY,
	ProductName					NVARCHAR(70) CONSTRAINT nn_product_name NOT NULL,
	ProductCategory 			NVARCHAR(40) CONSTRAINT nn_product_category NOT NULL,
	ProductWholesalePrice		MONEY CONSTRAINT nn_product_wholesale_price NOT NULL,
	ProductPackageType			NVARCHAR(50) CONSTRAINT nn_product_package_type NOT NULL,
	SupplierID					INT CONSTRAINT fk_supplier_product FOREIGN KEY REFERENCES Supplier(SupplierID),
	SubstrateID					INT CONSTRAINT fk_substrate_product FOREIGN KEY REFERENCES Substrate(SubstrateID)
	);
--
CREATE TABLE SupplierCertAcq
	(SupplierCertAcqID 			INT CONSTRAINT pk_supplier_cert_acq_id PRIMARY KEY,
	SupplierID					INT CONSTRAINT fk_supplier_cert_acq_supplier FOREIGN KEY REFERENCES Supplier(SupplierID),
	SupplierCertID				INT CONSTRAINT fk_supplier_cert_acq_supplier_cert FOREIGN KEY REFERENCES SupplierCert(SupplierCertID),
	SupplierCertAcqDate 		DATE CONSTRAINT nn_supplier_cert_acq_date NOT NULL,
	SupplierCertAcqExpiry 		DATE CONSTRAINT nn_supplier_cert_acq_expiry NOT NULL
	);
--
CREATE TABLE ProdCertAcq
	(ProdCertAcqID 				INT CONSTRAINT pk_prod_cert_acq_id PRIMARY KEY,
	ProductID					INT CONSTRAINT fk_prod_cert_acq_product FOREIGN KEY REFERENCES Product(ProductID),
	ProdCertID					INT CONSTRAINT fk_prod_cert_acq_prod_cert FOREIGN KEY REFERENCES ProdCert(ProdCertID),
	ProdCertAcqDate 			DATE CONSTRAINT nn_prod_cert_acq_date NOT NULL,
	ProdCertAcqExpiry 			DATE CONSTRAINT nn_prod_cert_acq_expiry NOT NULL
	);
--
CREATE TABLE [Order]
	(OrderID 					INT CONSTRAINT pk_order_id PRIMARY KEY,
	OrderDate 					DATE CONSTRAINT nn_order_date NOT NULL,
	ShipDate					DATE CONSTRAINT nn_ship_date NOT NULL,
	ConsumerID					INT CONSTRAINT fk_order_consumer FOREIGN KEY REFERENCES Consumer(ConsumerID)
	);
--
CREATE TABLE OrderItem
	(OrderID 					INT NOT NULL,
	ProductID					INT NOT NULL,
	OrderQuantity				INT CONSTRAINT nn_order_item_quantity NOT NULL,
	RetailPrice 				MONEY CONSTRAINT nn_order_item_retail NOT NULL,
	CONSTRAINT fk_order_item_order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
	CONSTRAINT fk_order_item_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
	);
--
--
-- Load table data
--
EXECUTE (N'BULK INSERT ConsumerMembership FROM ''' + @data_path + N'ConsumerMembershipData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Subscription FROM ''' + @data_path + N'SubscriptionData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT SupplierCert FROM ''' + @data_path + N'SupplierCertData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Certification FROM ''' + @data_path + N'CertificationData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT ProdCert FROM ''' + @data_path + N'ProdCertData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Substrate FROM ''' + @data_path + N'SubstrateData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Consumer FROM ''' + @data_path + N'ConsumerData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Supplier FROM ''' + @data_path + N'SupplierData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Product FROM ''' + @data_path + N'ProductData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT SupplierCertAcq FROM ''' + @data_path + N'SupplierCertAcqData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT ProdCertAcq FROM ''' + @data_path + N'ProdCertAcqData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT [Order] FROM ''' + @data_path + N'OrderData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT OrderItem FROM ''' + @data_path + N'OrderItemData.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');
--
-- List table names and row counts for confirmation
--
GO
SET NOCOUNT ON
SELECT 'ConsumerMembership' AS "Table",	COUNT(*) AS "Rows"	FROM ConsumerMembership		UNION
SELECT 'Subscription',					COUNT(*)			FROM Subscription    		UNION
SELECT 'SupplierCert',					COUNT(*)			FROM SupplierCert  			UNION
SELECT 'Certification',					COUNT(*)			FROM Certification  		UNION
SELECT 'ProdCert',						COUNT(*)			FROM ProdCert     			UNION
SELECT 'Substrate',						COUNT(*)			FROM Substrate          	UNION
SELECT 'Consumer',						COUNT(*)			FROM Consumer       		UNION
SELECT 'Supplier',						COUNT(*)			FROM Supplier   			UNION
SELECT 'Product',						COUNT(*)			FROM Product   				UNION
SELECT 'SupplierCertAcq',				COUNT(*)			FROM SupplierCertAcq   		UNION
SELECT 'ProdCertAcq',					COUNT(*)			FROM ProdCertAcq   			UNION
SELECT 'Order',							COUNT(*)			FROM [Order]   				UNION
SELECT 'OrderItem',						COUNT(*)			FROM OrderItem
ORDER BY 1;
SET NOCOUNT OFF
GO