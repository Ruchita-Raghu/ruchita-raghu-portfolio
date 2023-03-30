<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio#daniels-distinction-portfolio'><img src="https://user-images.githubusercontent.com/116829793/226443427-94c192b2-3c02-4a29-a2a8-e1b26aca6cd7.png" width=200> </a>

# FOUNDATIONS OF INFORMATION MANAGEMENT
## SEQUENCE OF CLASSES IN DATABASES, DATABASE MANAGEMENT, CODING, DATA WAREHOUSING WITH THE ANALYTICS DEPARTMENT
<p> The class introduced students to information management. A three quarter long project was to think of a business idea, create a fictional company, create a business problem, opportunity to build a database, build fictitious data, construct databases, create forms and reports, build data marts, conduct analysis, and create dashboards. A progressive sequence with extensive knowledge! </p>

## PART 1 - OLTP ON MICROSOFT ACCESS

#### EXECUTIVE SUMMARY
<p> Eco Products, Inc., is a manufacturing company, founded in Colorado, in 1990. Their purpose is to be “the vanguard of a Zero Waste future”. Their business is based on environmental concepts like recycling, reusing, composting, renewable resources, and sustainability. Their products include hot cups, cold cups, containers, utensils, and bags which are manufactured keeping those concepts in mind. Unlike other manufacturers, in order to remain environmentally conscious, the company needs to be aware of certain requirements and processes. There is an opportunity to build a database which will help them organize data, share data across centers, and visualize their progress. </p>
<p> ** Please note: No copyright infringement intended in terms of the company name. The data associated, its details, analysis, and conclusions do not pertain to the actual company called EcoProducts. All of the project codes, tables, names were all fictitiously created for the purpose of the project. No intention to copy company brands. </p>

#### BUSINESS PROBLEM AND OPPORTUNITY
<p> The need for a database arises due to several factors – 
      <li> The business environment is becoming data-driven which needs to company adapt to as well </li>
      <li> With climate change on the rise, additional requirements to remain “green” and “healthy” are continuously added by several authorities like the UN, WHO, FSC etc. </li>
      <li> Increased need to integrate data from different product development initiatives to support overall decision making </li>
      <li> The need to maximize efficiency and eliminate time-consuming back-office tasks, for example, retrieving data about products and suppliers can be effortless </li>
      <li> The need to remain competitive and adapt to business environment changes requires ready-to-go databases with up-to-date data </li> </p>
<p> Eco Products is a manufacturing company, i.e., they are supplied materials which are used to further make eco-friendly products. They also make products by recycling waste that they collect themselves. </p>
<p> The number of people involved in making the planet a better place is increasing so, the suppliers who are willing to provide material are increasing. As more suppliers come on-board, the company needs to monitor their quality, relationship, ethics, and safety. Therefore, several certifications (adhering to global standards) are introduced. Consumers are increasingly interested in using products which are good for their health and their surroundings. There is a need to know what they prefer, how much they prefer etc., which guides the entire business of the company. The company has also set aside certain assessments and checkpoints for their finished products which helps ensure that good quality and safe products are sold. </p>
<p> In addition to product and supplier certifications, there are substrates (underlying material or layer) that the company deems as the top five important eco-friendly material that make their products differentiate from competitors and reduce harm after disposal. The company encourages the use of these material in as many of their products as possible. It is imperative to “enter” data on a continuous basis for these stated metrics because this guides the company towards its goal, and it will help them stay on track.</p>

#### ENTITY-RELATIONSHIP DIAGRAM (ERD)
<p> An Entity Relationship Diagram (ERD) is abstructural diagram used when designing the structure of databases. It contains different symbols and connectors that visualize two things: the major entities and the inter-relationships among them. It is built keeping in mind the above business problem and available data. </p>
<img src="https://user-images.githubusercontent.com/116829793/202918596-2db470e7-6a0d-4cd2-94f8-6050ce451fa4.png" height=400 width=600>

#### CREATED ACCESS DATABASE
<p> Microsoft Access was utilized to load all the data and create a database on the personal system. </p>
<p> Download the Microsoft Access Database below </p>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/raw/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20EcoProducts%20Database.accdb'><img src="https://user-images.githubusercontent.com/116829793/227296707-c1ee94fe-d3ff-4edb-9399-8dd7ac4519e3.png" width=480 /> </a>

<p> <b> Features used in Microsoft Access </b>
<li> Loading Data - Imported several excel sheets with data, conducted data cleaning </li>
<li> Keys and Connections - Primary keys were established, connected all tables and constructed the ERD within Access </li>
<li> SQL Queries - Stored several SQl queries which involved extracting data from multiple tables at once. These queries helped bring data to surface based on what the business question is. </li>
<li> Reports - Reports were also built within Access including buttons, report filters, SQL queries embedded, multiple tabs/pages to switch etc. These reports presented a "better" view for senior executives and managers. </li> </p>

<br>
<p> <b> Find below sample SQL Queries to Extract Data from Database </b> </p>
<pre> -- BUSINESS QUESTION : Are there products which have not yet been certified?
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

<pre> -- BUSINESS QUESTION : List the consumers with their last order placed and the order details.
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

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>


## PART 2 - OLTP ON MICROSOFT SQL SERVER
#### ENTITY RELATIONSHIP DIAGRAM IMPROVISED
<p> Based on feedback and suggestions, the ERD was improvised to include more meaningful data for analysis. </p>
<img src="https://user-images.githubusercontent.com/116829793/202939020-79ef2c31-e7e7-4f20-b4f8-4d46522830ea.png" height=500 width=900>

#### BUILD SCRIPT FOR OLTP
<p> OLTP stands for Online Transaction Processing. The database was created using SQL using Microsoft SQL Server. The database tables are first created by setting all attributes with their constraints. The data for each table was then imported with Bulk Insert statements from csv files. </p>

<li> Features used in SQL Server - SQL Server Configuration Manager, SQL Server Management Studio, SQL Server Integration Services, SQL Server Analysis Services, SQL Server Reporting Services. </li>
<li> Engaged with database objects - Datbases, transaction log, tables, views, Stored Procedures, User-defined functions, users and roles </li>
<li> Types of code used in T-SQL - 
 <ul>
	 <li> CREATE DATABASE/TABLE/VIEW </li>
	 <li> SELECT/FROM/WHERE/GROUP BY/HAVING/ORDER BY </li>
	 <li> USE, GO, CONSTRAINT, NOT NULL </li>
	 <li> PRIMARY/FOREIGN KEY with REFERENCES </li>
	 <li> data types NVARCHAR/INT/MONEY/DATE/TIME </li> 
	 <li> Relational operators =, <, >, <> </li> 
	 <li> Logical operators such as ALL, AND, OR, EXISTS, IN, SOME, ANY, BETWEEN/AND, IS NULL, LIKE </li> 
         <li> Date and Time functions such as DATEADD, DATEDIFF, DATEPART, DAY etc. </li>
	 <li> Working with data CONVERT, COALESCE, AVG, COUNT, SUM, DISTINCT COUNT, IF-THEN-ELSE, CASE, ROLLUP </li>
	 <li> Joins - INNER JOIN, LEFT/RIGHT JOIN, OUTER JOIN, UNION </li>
		 </ul></li>

<p> Process to build script </p>
	<li> Scripts were created in batches with GO statements </li>
	 <li> We began with creating the database, declaring a path to access the data files </li>
	 <li> If and where statments to drop existing tables if they exist, to allow for re-run of code </li>
	 <li> Create tables with setting data types, constraints, foreign and primary keys </li>
	 <li> In the end, the Execute bulk and Insert Into statements were used to load data from Excel/csv files to the server </li>
		 
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20NewBuildEcoProducts.sql'><img src="https://user-images.githubusercontent.com/116829793/227299726-fca2df69-9e1f-4f3e-8350-308ac62ae339.png" width=350 /> </a>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/raw/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20EcoProducts%20OLTP%20CSVs.zip'><img src="https://user-images.githubusercontent.com/116829793/227303967-ff83027d-095c-4507-89a9-329b4b808142.png" width=350 /> </a>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>

#### USER DEFINED FUNCTION (UDF), STORED PROCEDURE (SPROC), VIEW SCRIPT
<p> UDFs and SPROCs were created </p>
	<li> Create statements for function, sproc, views were set up in batches </li>
	<li> The SET command with INNER JOINs was used, BEGIN and END statements, test commands were also run to return error messages if value not found </li>
	<li> UDF 1 - Create a function to input the state code/abbreviation that returns that number of orders for that state's consumers. </li>
	<li> UDF 2 - Create a function that returns the retail price of a product on entering its name or ID. </li>
	<li> SPROC - Create a stored procedure that takes a consumer's first and last name and gives the order information for them, separate orders in separate lines. </li>
<br>
<p> Access the text file with code for the above. </p>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20EcoProductsSQLScripts.sql'><img src="https://user-images.githubusercontent.com/116829793/227302725-18f4a6e6-3d9a-446f-ac2a-2308f4edaabc.png" width=350 /> </a>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>
<br>
#### PRESENTATION OF SQL SERVER DATABASE FORMS AND REPORTS
In Visual Studio, in a VB.NET environment, I created forms and reports for the database. Watch the recording below!
<a name="VideoDemo"></a>

https://user-images.githubusercontent.com/116829793/203178129-d8ecc5bd-95e2-4013-97ae-b94d5f31e17f.mp4

<br>

https://user-images.githubusercontent.com/116829793/203178196-c6ddf8c5-721e-4dea-be7d-d55066df771f.mp4

<br>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>


## PART 3 - OLAP IN MICROSOFT SQL SERVER, VISUAL STUDIO, POWER BI
#### PHASE 1 - SOLUTION DOCUMENTATION
<p> Created documentation and Visual Studio solution to transition from OLTP to OLAP. OLAP stands for..... Created the object worksheet, star schema etc. </p>
<p> Download the Solution Development Plan, Object Worksheet, STAR Schema files </p>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/raw/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20EcoProducts%20Solution%20Documentation.zip'><img src="https://user-images.githubusercontent.com/116829793/227308292-4ad677d9-9bed-4fb1-9a45-8c7dd7f16605.png" width=350 /> </a>

<p> The Datamart was created for....</p>

<img src="https://user-images.githubusercontent.com/116829793/202945019-87dc289e-994c-4c61-8650-ab2d1256d79d.png">

#### PHASE 2 - DM BUILD SCRIPT
<p> Based on business requirements laid out above, created the datamart build script by denormalizing all data tables in the database. </p>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20BuildEcoProductsDM.sql'><img src="https://user-images.githubusercontent.com/116829793/227309145-0bc0b2d5-1ca5-47c4-aafb-44b8b5072116.png" width=350 /> </a>

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>


#### PHASE 3 - ETL - EXTRACT, TRANSFORM, LOAD
<p> Explain ETL process </p>
<p> Features used and lessons learned </p>

<img src="https://user-images.githubusercontent.com/116829793/202946122-33e771e2-76dc-4bfb-b487-020043a19eff.png">
<img src="https://user-images.githubusercontent.com/116829793/202946191-e3ff20d4-75c2-470b-be11-b1e209bad6fa.png">

#### PHASE 4 - POWER PIVOT MULTIDIMENSIONAL ANALYSIS
<p> Explain process and features used </p>

<img src="https://user-images.githubusercontent.com/116829793/202946361-7ff5f53f-2eb0-4010-8f47-0213b0854867.png">

#### PHASE 5 - POWERBI DASHBOARD REPORTING
<p> Explain process, features used, DAX etc. </p>
<img src="https://user-images.githubusercontent.com/116829793/202948295-0c366311-8f9d-4a4f-8896-c93bf826a99f.png">
<br>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/raw/main/EcoProducts%2C%20Inc%20OLTP%20%26%20OLAP/Ruchita%20-%20EcoProducts%20DataMart%20Reporting.zip'><img src="https://user-images.githubusercontent.com/116829793/227311900-e00457e6-eda4-4c6c-aa5e-209a1c095b3f.png" width=350 /> </a>
<br>
<br>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/EcoProducts,%20Inc%20OLTP%20&%20OLAP/Database%20Management%20ReadMe.md#foundations-of-information-management'> <img src="https://user-images.githubusercontent.com/116829793/226444715-037051b9-7b32-495b-a068-1e3ff700ac62.png" width=230 /> </a>
