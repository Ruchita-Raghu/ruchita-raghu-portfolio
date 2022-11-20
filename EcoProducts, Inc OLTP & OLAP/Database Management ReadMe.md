# FOUNDATIONS OF INFORMATION MANAGEMENT
## SEQUENCE OF CLASSES IN DATABASES, DATABASE MANAGEMENT, CODING, DATA WAREHOUSING WITH THE ANALYTICS DEPARTMENT
<p> The class introduced students to information management. A three quarter long project was to think of a business idea, create a fictional company, create a business problem, opportunity to build a database, build fictitious data, construct databases, create forms and reports, build data marts, conduct analysis, and create dashboards. A progressive sequence with extensive knowledge! </p>

## PART 1 - OLTP ON MICROSOFT ACCESS

#### EXECUTIVE SUMMARY
<p> Eco Products, Inc., is a manufacturing company, founded in Colorado, in 1990. Their purpose is to be “the vanguard of a Zero Waste future”. Their business is based on environmental concepts like recycling, reusing, composting, renewable resources, and sustainability. Their products include hot cups, cold cups, containers, utensils, and bags which are manufactured keeping those concepts in mind. Unlike other manufacturers, in order to remain environmentally conscious, the company needs to be aware of certain requirements and processes. There is an opportunity to build a database which will help them organize data, share data across centers, and visualize their progress. </p>

#### BUSINESS PROBLEM AND OPPORTUNITY
<pre> The need for a database arises due to several factors – 
      The business environment is becoming data-driven which needs to company adapt to as well
      With climate change on the rise, additional requirements to remain “green” and “healthy” are continuously added by several authorities like the UN, WHO, FSC etc.
      Increased need to integrate data from different product development initiatives to support overall decision making
      The need to maximize efficiency and eliminate time-consuming back-office tasks, for example, retrieving data about products and suppliers can be effortless
      The need to remain competitive and adapt to business environment changes requires ready-to-go databases with up-to-date data
Eco Products is a manufacturing company, i.e., they are supplied materials which are used to further make eco-friendly products. They also make products by recycling waste that they collect themselves.
The number of people involved in making the planet a better place is increasing so, the suppliers who are willing to provide material are increasing. As more suppliers come on-board, the company needs to monitor their quality, relationship, ethics, and safety. Therefore, several certifications (adhering to global standards) are introduced. Consumers are increasingly interested in using products which are good for their health and their surroundings. There is a need to know what they prefer, how much they prefer etc., which guides the entire business of the company. The company has also set aside certain assessments and checkpoints for their finished products which helps ensure that good quality and safe products are sold.
In addition to product and supplier certifications, there are substrates (underlying material or layer) that the company deems as the top five important eco-friendly material that make their products differentiate from competitors and reduce harm after disposal. The company encourages the use of these material in as many of their products as possible. It is imperative to “enter” data on a continuous basis for these stated metrics because this guides the company towards its goal, and it will help them stay on track. </pre>

#### ENTITY-RELATIONSHIP DIAGRAM (ERD)
<img src="https://user-images.githubusercontent.com/116829793/202918596-2db470e7-6a0d-4cd2-94f8-6050ce451fa4.png">

#### CREATED ACCESS DATABASE
<img width="629" alt="image" src="https://user-images.githubusercontent.com/116829793/202918760-e387b1de-7462-41d3-a60c-6da09cb86948.png">
<img width="628" alt="image" src="https://user-images.githubusercontent.com/116829793/202918791-2a44a251-ce47-4d5c-ba2a-4b0bd79c8a84.png">
<img width="628" alt="image" src="https://user-images.githubusercontent.com/116829793/202918842-40d90771-18d4-4eea-984b-496a372e85a8.png">
<img width="626" alt="image" src="https://user-images.githubusercontent.com/116829793/202918897-ceb6f612-61f0-49a1-8181-7c65374b072f.png">
<img width="275" alt="image" src="https://user-images.githubusercontent.com/116829793/202918927-196f3ced-4cd5-4441-81e1-63c0e1b27047.png">

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


## PART 2 - OLTP ON MICROSOFT SQL SERVER
#### BUILD SCRIPT
#### UDF AND VIEW SCRIPT
#### DATA CREATION DETAILS + SQL SERVER DIAGRAM
#### VIDEO RECORDING OF PRESENTATION
#### FORMS AND REPORTS BACKEND CODE


## PART 3 - OLAP IN MICROSOFT SQL SERVER, VISUAL STUDIO, POWER BI
#### NEW ERD
#### PHASE 1 - SOLUTION DOCUMENTATION
#### PHASE 2 - DM BUILD SCRIPT
#### PHASE 3 - ETL SCREENSHOT
#### PHASE 4 - POWER PIVOT SCREENSHOT
#### PHASE 5 - POWERBI DASHBOARD SCREENSHOT





