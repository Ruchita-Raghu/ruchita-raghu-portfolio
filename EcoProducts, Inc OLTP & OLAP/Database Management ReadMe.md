<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio#welcome-my-name-is-ruchita-raghunandan-here-is-a-little-about-me-and-my-work'><img src="https://user-images.githubusercontent.com/116829793/226443427-94c192b2-3c02-4a29-a2a8-e1b26aca6cd7.png" width=200> </a>

# FOUNDATIONS OF INFORMATION MANAGEMENT
## SEQUENCE OF CLASSES IN DATABASES, DATABASE MANAGEMENT, CODING, DATA WAREHOUSING WITH THE ANALYTICS DEPARTMENT
<p> The class introduced students to information management. A three quarter long project was to think of a business idea, create a fictional company, create a business problem, opportunity to build a database, build fictitious data, construct databases, create forms and reports, build data marts, conduct analysis, and create dashboards. A progressive sequence with extensive knowledge! </p>

## PART 1 - OLTP ON MICROSOFT ACCESS

#### EXECUTIVE SUMMARY
<p> Eco Products, Inc., is a manufacturing company, founded in Colorado, in 1990. Their purpose is to be “the vanguard of a Zero Waste future”. Their business is based on environmental concepts like recycling, reusing, composting, renewable resources, and sustainability. Their products include hot cups, cold cups, containers, utensils, and bags which are manufactured keeping those concepts in mind. Unlike other manufacturers, in order to remain environmentally conscious, the company needs to be aware of certain requirements and processes. There is an opportunity to build a database which will help them organize data, share data across centers, and visualize their progress. </p>
<p> ** Please note: No copyright infringement intended in terms of the company name. The data associated, its details, analysis, and conclusions do not pertain to the actual company called EcoProducts. All of the project codes, tables, names were all fictitiously created for the purpose of the project. No intention to copy company brands. </p>

#### BUSINESS PROBLEM AND OPPORTUNITY
The need for a database arises due to several factors – 
      The business environment is becoming data-driven which needs to company adapt to as well
      With climate change on the rise, additional requirements to remain “green” and “healthy” are continuously added by several authorities like the UN, WHO, FSC etc.
      Increased need to integrate data from different product development initiatives to support overall decision making
      The need to maximize efficiency and eliminate time-consuming back-office tasks, for example, retrieving data about products and suppliers can be effortless
      The need to remain competitive and adapt to business environment changes requires ready-to-go databases with up-to-date data
Eco Products is a manufacturing company, i.e., they are supplied materials which are used to further make eco-friendly products. They also make products by recycling waste that they collect themselves.
The number of people involved in making the planet a better place is increasing so, the suppliers who are willing to provide material are increasing. As more suppliers come on-board, the company needs to monitor their quality, relationship, ethics, and safety. Therefore, several certifications (adhering to global standards) are introduced. Consumers are increasingly interested in using products which are good for their health and their surroundings. There is a need to know what they prefer, how much they prefer etc., which guides the entire business of the company. The company has also set aside certain assessments and checkpoints for their finished products which helps ensure that good quality and safe products are sold.
In addition to product and supplier certifications, there are substrates (underlying material or layer) that the company deems as the top five important eco-friendly material that make their products differentiate from competitors and reduce harm after disposal. The company encourages the use of these material in as many of their products as possible. It is imperative to “enter” data on a continuous basis for these stated metrics because this guides the company towards its goal, and it will help them stay on track. 

#### ENTITY-RELATIONSHIP DIAGRAM (ERD)
<img src="https://user-images.githubusercontent.com/116829793/202918596-2db470e7-6a0d-4cd2-94f8-6050ce451fa4.png">

#### CREATED ACCESS DATABASE
<p> Navigation/Startup form </p>
<img src="https://user-images.githubusercontent.com/116829793/202918760-e387b1de-7462-41d3-a60c-6da09cb86948.png">
<p> Sample forms and subforms </p>
<img src="https://user-images.githubusercontent.com/116829793/202918791-2a44a251-ce47-4d5c-ba2a-4b0bd79c8a84.png">
<img src="https://user-images.githubusercontent.com/116829793/202918842-40d90771-18d4-4eea-984b-496a372e85a8.png">
<p> Sample report and report filter button </p>
<img src="https://user-images.githubusercontent.com/116829793/202918897-ceb6f612-61f0-49a1-8181-7c65374b072f.png">
<img src="https://user-images.githubusercontent.com/116829793/202918927-196f3ced-4cd5-4441-81e1-63c0e1b27047.png">
<br>
<p> <b> SAMPLE SQL QUERIES TO EXTRACT DATA FROM DATABASE </b> </p>
<pre> -- BUSINESS QUESTION 1 : Are there products which have not yet been certified?
SELECT DISTINCT PRODUCT.ProductID, PRODUCT.ProductName, PRODUCT.ProductCategory
FROM (PRODUCT
LEFT JOIN PROD_CERT_ACQ
	ON PRODUCT.ProductID = PROD_CERT_ACQ.ProductID)
LEFT JOIN PROD_CERT
	ON PROD_CERT.ProdCertID = PROD_CERT_ACQ.ProdCertID
WHERE PRODUCT.ProductID NOT IN (SELECT PROD_CERT_ACQ.ProductID FROM PROD_CERT_ACQ)
ORDER BY PRODUCT.ProductCategory;

-- REASONING : It will be important to know which products are yet to be certified and what categories they belong to. It will be helpful for the company to later think of what certifications they can pursue next.
-- ANSWER AND INTERPRETATION : There are 23 out of the total 40 products not certified yet. These products belong to different categories like clear products, cold cups, green products etc. There is an indication of divided attention with certifications. The company is trying to certify in many things. They could possibly focus on one category first, specialize in that, then move to the next which also helps in building a competitive edge. </pre>

<pre> -- BUSINESS QUESTION 4 : List the consumers with their last order placed and the order details.
SELECT CONSUMER.ConsumerFirstName, CONSUMER.ConsumerLastName, [ORDER].OrderDate, PRODUCT.ProductName, SUM(PRODUCT.ProductRetailPrice) AS [Sale amount]
FROM (CONSUMER
INNER JOIN [ORDER]
	ON CONSUMER.ConsumerID = [ORDER].ConsumerID)
INNER JOIN PRODUCT
	ON PRODUCT.ProductID = [ORDER].ProductID
WHERE [ORDER].OrderDate = (SELECT MAX([ORDER].OrderDate) FROM [ORDER] WHERE CONSUMER.ConsumerID = [ORDER].ConsumerID)
GROUP BY CONSUMER.ConsumerFirstName, CONSUMER.ConsumerLastName, [ORDER].OrderDate, PRODUCT.ProductName
ORDER BY [ORDER].OrderDate;

-- REASONING : A view of when the customer placed their last order. It will be helpful to know inactive customers also. 
-- ANSWER AND INTERPRETATION : There are many customers who purchased last in 2010, 2011, 2012, 2013. Maybe these customer accounts can be closed, reopened if necessary. There are customer who purchased last in 2019 & 2020, maybe some promotional offers/cards can be sent to bring them back. </pre>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>


## PART 2 - OLTP ON MICROSOFT SQL SERVER
#### ERD IMPROVISED
<img src="https://user-images.githubusercontent.com/116829793/202939020-79ef2c31-e7e7-4f20-b4f8-4d46522830ea.png">

#### BUILD SCRIPT FOR OLTP
Database created using SQL. The database tables are first created by setting all attributes with their constraints. The data for each table was then imported with Bulk Insert statements from csv files.
Below are snapshots. Find the entire build script <a href="https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/NewBuildEcoProducts.sql">here.</a>
<pre> -- EcoProducts database developed and written by Ruchita Raghunandan
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
	DROP TABLE [OrderItem]; </pre>
<pre>
CREATE TABLE Consumer
	(ConsumerID				INT CONSTRAINT pk_consumer_id PRIMARY KEY,
	ConsumerFirstName			NVARCHAR(30) CONSTRAINT nn_consumer_first_name NOT NULL,
	ConsumerLastName			NVARCHAR(40) CONSTRAINT nn_consumer_last_name NOT NULL,
	ConsumerPhoneNo				NVARCHAR(15) CONSTRAINT nn_consumer_phone_no NOT NULL,
	ConsumerAddress				NVARCHAR(70) CONSTRAINT nn_consumer_address NOT NULL,
	ConsumerCity				NVARCHAR(30) CONSTRAINT nn_consumer_city NOT NULL,
	ConsumerState				NCHAR(2)  CONSTRAINT nn_consumer_state NOT NULL,
	ConsumerZip				NVARCHAR(10) CONSTRAINT nn_consumer_zip NOT NULL,
	ConsumerShippingChosen			NVARCHAR(40) CONSTRAINT nn_consumer_shipping_chosen NOT NULL,
	ConsumerMemberCode			INT CONSTRAINT fk_member_consumer FOREIGN KEY REFERENCES ConsumerMembership(ConsumerMemberCode),
	SubscriptionCode			INT CONSTRAINT fk_subscription_consumer FOREIGN KEY REFERENCES Subscription(SubscriptionCode)
	); </pre>
<pre> -- Load table data
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
'); </pre>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>

#### USER DEFINED FUNCTION, STORED PROCEDURE, VIEW SCRIPT
<pre> -- UDF 1
-- Question: Create a function to input the state code/abbreviation that returns that number of orders for that state's consumers. 
-- Purpose: Depending on state law changes or other developments in states, searching through how a state might be performing and whether the number of orders have been decresing or increasing with time.
CREATE FUNCTION ufn_StateOrders
	 (@InputState NCHAR(2))
 	 RETURNS INT

BEGIN
	DECLARE @NumOrders INT
	SET @NumOrders = -1
		IF LEN(@InputState) = 2
			BEGIN
				SELECT @NumOrders = COUNT(OrderID)
				FROM Consumer
				INNER JOIN [Order]
					ON Consumer.ConsumerID = [Order].ConsumerID
				WHERE ConsumerState = @InputState
			END
RETURN @NumOrders
END;
--
-- Testing function with different states
SELECT dbo.ufn_StateOrders('CA') AS [Number of Orders from Entered State];
SELECT dbo.ufn_StateOrders('CO') AS [Number of Orders from Entered State];
SELECT dbo.ufn_StateOrders('MN') AS [Number of Orders from Entered State];
SELECT dbo.ufn_StateOrders('3') AS [Please enter valid state code]; </pre>

<pre> -- UDF 2
-- Question: Create a function that returns the retail price of a product on entering its name or ID.
-- Purpose: An efficient manner to lookup prices for products. Function will be helpful in a stored procedure also. 
CREATE FUNCTION ufn_ProductRetailPrice
	 (@InputProduct NVARCHAR(70))
 	 RETURNS MONEY

BEGIN
  	DECLARE @RetailPrice MONEY
	SET @RetailPrice = -1
	IF LEN(@InputProduct) = 1
		BEGIN 
			SELECT @RetailPrice = ProductRetailPrice
  			FROM Product
 			WHERE ProductID = @InputProduct
		END
	ELSE
		IF LEN(@InputProduct) = 2
			BEGIN
				SELECT @RetailPrice = ProductRetailPrice
  				FROM Product
 				WHERE ProductID = @InputProduct
			END
		ELSE
			BEGIN
				SELECT @RetailPrice = ProductRetailPrice
  				FROM Product
 				WHERE ProductName = @InputProduct
			END
RETURN @RetailPrice
END;
--
--Testing function with different product names
SELECT dbo.ufn_ProductRetailPrice('40') AS [Retail Price];
SELECT dbo.ufn_ProductRetailPrice('Glass Mugs') AS [Retail Price];
SELECT dbo.ufn_ProductRetailPrice('Clear') AS [Please enter valid product id or name]; </pre>

<pre> -- UDF 3
-- Question: Create a function that returns the months left for a certification renewal for a supplier with a chosen certificate name.
-- Purpose: A quick way to enter key details and get to know the months left for renewal. Supplier certifications are mandatory legally. According to the company's policy, every supplier should have at least one active certification. This helps check approaching renewals.
CREATE FUNCTION ufn_SupplierRenewal
	 (@InputSupplierID INT, @InputCertID INT, @FromDate DATE)
 	 RETURNS INT

BEGIN
  	DECLARE @SCertExpiry DATE, @SupplierRenew INT
  	SELECT @SCertExpiry = SupplierCertAcqExpiry
  	FROM SupplierCertAcq
 	WHERE SupplierID = @InputSupplierID AND SupplierCertID = @InputCertID
  	SET @SupplierRenew = DATEDIFF(MONTH,@SCertExpiry,@FromDate)
RETURN @SupplierRenew
END;
--
-- Testing the function with different details
SELECT dbo.ufn_SupplierRenewal(207,10,'4/24/2020') AS [Months left for renewal];
SELECT dbo.ufn_SupplierRenewal(201,7,'1/1/2019') AS [Months left for renewal]; </pre>

<pre> -- Question: Create a stored procedure that takes a consumer's first and last name and gives the order information for them, separate orders in separate lines.
-- Purpose: An easy manner to lookup consumer track records. Depending on any consumer complaints, returns etc., the procedure helps see record of orders with id, date, product, order total etc.
CREATE PROCEDURE usp_ConsumerOrders (@FirstName NVARCHAR(30)=NULL, @LastName NVARCHAR(40)=NULL)
AS
BEGIN
	DECLARE @OrderCount INT
	IF @FirstName IS NOT NULL
		BEGIN
			SELECT @OrderCount = COUNT(*)
			FROM Consumer
			INNER JOIN [Order]
				ON Consumer.ConsumerID = [Order].ConsumerID
			INNER JOIN Product
				ON Product.ProductID = [Order].ProductID
			WHERE Consumer.ConsumerFirstName = @FirstName AND Consumer.ConsumerLastName = @LastName
			IF @OrderCount = 0
				BEGIN
					SELECT 'No orders for Customer ' + @FirstName + ' ' + @LastName AS "Warning Message"
				END;
		SELECT [Order].OrderID, [Order].OrderDate, Product.ProductID, Product.ProductName, Product.ProductCategory, '$' + CONVERT(NVARCHAR,dbo.ufn_ProductRetailPrice(Product.ProductID)*COUNT([Order].OrderID)) AS [Amount in Order]
		FROM Consumer
			INNER JOIN [Order]
				ON Consumer.ConsumerID = [Order].ConsumerID
			INNER JOIN Product
				ON Product.ProductID = [Order].ProductID
		WHERE Consumer.ConsumerFirstName = @FirstName AND Consumer.ConsumerLastName = @LastName
		GROUP BY [Order].OrderID, [Order].OrderDate, Product.ProductID, Product.ProductName, Product.ProductCategory
		ORDER BY 1
		RETURN (0);
	END;
	ELSE
		BEGIN
			SELECT 'Ommitted Parameter: EXEC ConsumerOrders "FirstName" and "Lastname". The form to use this procedure is: EXEC usp_ConsumerOrders "<FirstName>""<LastName>"' AS "Warning Message"
			RETURN (1);
		END;
END;
--
--Testing the procedure
EXEC usp_ConsumerOrders 'Katie','Bilbey';
EXEC usp_ConsumerOrders 'Ruchita','Raghunandan';
EXEC usp_ConsumerOrders; </pre>

<pre> -- Create View for Uncertified Products
CREATE VIEW UncertifiedProducts
AS
	SELECT Product.ProductCategory, Product.ProductID, Product.ProductName, Product.ProductRetailPrice, [Order].OrderID, [Order].OrderDate
	FROM [Order]
	LEFT JOIN Product
		ON Product.ProductID = [Order].ProductID
	LEFT JOIN ProdCertAcq
		ON Product.ProductID = ProdCertAcq.ProductID
	LEFT JOIN ProdCert
		ON ProdCert.ProdCertID = ProdCertAcq.ProdCertID
	WHERE ProdCertAcq.ProdCertAcqID IS NULL
WITH CHECK OPTION;
GO
--
-- View the view
SELECT * FROM UncertifiedProducts;
--
-- Testing usage of view with business context
-- Question: How many times was each uncertified product ordered? How much revenue did it bring?
-- Answer: About 23 uncertified products are seen. We onserve that they are highly ordered by consumers and are bringing good revenue for the company as well. This leads us to think if it might be time for the company to get these products certified to maintain competitive edge.
SELECT ProductCategory, ProductName, COUNT(OrderID) AS [No. of orders], '$' + CONVERT(NVARCHAR,SUM(ProductRetailPrice),1) AS [Total Revenue]
FROM UncertifiedProducts
GROUP BY ProductCategory, ProductName
ORDER BY COUNT(OrderID) DESC, SUM(ProductRetailPrice) DESC; </pre>

<br>

#### PRESENTATION OF SQL SERVER DATABASE FORMS AND REPORTS
In Visual Studio, in a VB.NET environment, I created forms and reports for the database. Watch the recording below!
<a name="VideoDemo"></a>

https://user-images.githubusercontent.com/116829793/203178129-d8ecc5bd-95e2-4013-97ae-b94d5f31e17f.mp4

<br>

https://user-images.githubusercontent.com/116829793/203178196-c6ddf8c5-721e-4dea-be7d-d55066df771f.mp4

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>


## PART 3 - OLAP IN MICROSOFT SQL SERVER, VISUAL STUDIO, POWER BI
#### PHASE 1 - SOLUTION DOCUMENTATION
Created documentation and Visual Studio solution to transition from OLTP to OLAP. Here are snapshots of the Solution Development Plan.
<img src="https://user-images.githubusercontent.com/116829793/202944783-e91508ca-7423-4515-b10a-3f7a0cab00ed.png" height=450 width=700>

<img src="https://user-images.githubusercontent.com/116829793/202944982-776821c0-854a-4bf8-a05e-fd6fef2502b4.png">
<img src="https://user-images.githubusercontent.com/116829793/202945019-87dc289e-994c-4c61-8650-ab2d1256d79d.png">
Object Worksheet
<img src="https://user-images.githubusercontent.com/116829793/202945116-e0be756a-a899-433b-a302-8aed7e5aebbe.png">
STAR Schema
<img src="https://user-images.githubusercontent.com/116829793/202945169-b13de759-b8a4-4d49-bb8f-9b6df787cf9d.png">

#### PHASE 2 - DM BUILD SCRIPT
Based on business requirements laid out above, created datamart build script by denormalizing all data tables in the database.
Below are snapshots. Find the entire build script <a href="https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/BuildEcoProductsDM.sql">here.</a>

<pre> -- EcoProductsDM developed and written by Ruchita Raghunandan
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
	DROP TABLE DimProduct; </pre>

<pre> -- Creating tables 
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
	); </pre>

<pre> CREATE TABLE FactSales
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
	); </pre>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>

#### PHASE 3 - ETL - EXTRACT, TRANSFORM, LOAD
<img src="https://user-images.githubusercontent.com/116829793/202946122-33e771e2-76dc-4bfb-b487-020043a19eff.png">
<img src="https://user-images.githubusercontent.com/116829793/202946157-08037023-6341-461d-8c7d-1cfb56d834bf.png">
<img src="https://user-images.githubusercontent.com/116829793/202946191-e3ff20d4-75c2-470b-be11-b1e209bad6fa.png">

#### PHASE 4 - POWER PIVOT MULTIDIMENSIONAL ANALYSIS
<img src="https://user-images.githubusercontent.com/116829793/202946361-7ff5f53f-2eb0-4010-8f47-0213b0854867.png">
<img src="https://user-images.githubusercontent.com/116829793/202946562-3793caeb-ed3a-45c6-9b64-b71fc07b85e4.png">
<img src="https://user-images.githubusercontent.com/116829793/202946598-77ac8098-caaf-41d3-852a-70490bc8c552.png">
<img src="https://user-images.githubusercontent.com/116829793/202946651-107cb3a1-6dd6-4dfc-af79-af7063c3a7cd.png">

<img src="https://user-images.githubusercontent.com/116829793/202946842-89bef4bd-18a7-450f-ae79-4dfed7196234.png">
<img src="https://user-images.githubusercontent.com/116829793/202946949-38e66f7e-e14f-4088-b90f-bcd4637d1cdb.png">

#### PHASE 5 - POWERBI DASHBOARD REPORTING
<img src="https://user-images.githubusercontent.com/116829793/202947989-bfd0a03c-76c9-443a-aa6a-bab388bbd77d.png">
<img src="https://user-images.githubusercontent.com/116829793/202948295-0c366311-8f9d-4a4f-8896-c93bf826a99f.png">
<img src="https://user-images.githubusercontent.com/116829793/203185180-f085b6c1-a932-42c8-83ce-d9ddeadd202e.png">



Certain DAX measures and columns I made - 
<pre>
Above Average Revenue Orders = CALCULATE(DISTINCTCOUNT('Sales'[SalesOrderID_DD]),FILTER('Sales','Sales'[Revenue] > AVERAGE('Sales'[Revenue])))
Below Average Quantity Orders = CALCULATE(DISTINCTCOUNT('Sales'[SalesOrderID_DD]),FILTER('Sales','Sales'[OrderQuantity] < AVERAGE('Sales'[OrderQuantity])))
Sales Orders = DISTINCTCOUNT('Sales'[SalesOrderID_DD])
AverageRetailCharged = AVERAGEX(RELATEDTABLE(Sales),[RetailPrice])
ConsumerLocation = 'Consumer'[ConsumerCity] & ", " & 'Consumer'[ConsumerState] </pre>
<br>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>
