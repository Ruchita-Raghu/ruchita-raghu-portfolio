-- EcoProducts Script written by Ruchita Raghunandan
-- Project Peer Reviewed by Hanna Ray
-- Last Updated: April 2022
-- Setting current database
USE EcoProducts
GO
-- VIEWS CREATED
-- IDEA BEHIND VIEWS - Out of the 40 products, there are some which have obtained certifications and some which have not. There are two distinct groups made based on that, certified and uncertified. Having these views ready helps extract information about them easily.
--
-- Create View for Certified Products
CREATE VIEW CertifiedProducts
AS
	SELECT Product.ProductCategory, Product.ProductID, Product.ProductName, Product.ProductRetailPrice, ProdCert.ProdCertName, ProdCert.ProdCertFee, ProdCertAcq.ProdCertAcqExpiry
	FROM Product
	INNER JOIN ProdCertAcq
		ON Product.ProductID = ProdCertAcq.ProductID
	INNER JOIN ProdCert
		ON ProdCert.ProdCertID = ProdCertAcq.ProdCertID
	WHERE ProdCertAcq.ProdCertAcqID IS NOT NULL
WITH CHECK OPTION;
GO
--
-- View the view
SELECT * FROM CertifiedProducts;
--
-- Testing usage of view with business context
-- Question: Clear Products is a popular product category for the company. List all clear products and the amount spent on their certifications.
-- Answer: A list of 5 clear products shows that some of them have certification amounts which are crossing the average amount for a product certification. This means the company could look into additional resources to get discounts or lower prices as it is a popular category for consumers.
SELECT ProductName, ProdCertName, SUM(ProdCertFee) AS [Certification amount spent]
FROM CertifiedProducts
WHERE ProductCategory = 'Clear Product'
GROUP BY ProductName, ProdCertName
HAVING SUM(ProdCertFee) > (SELECT AVG(ProdCertFee) FROM CertifiedProducts);
--
-- Question: List the number of certifications for products that have more than 1 certification.
-- Answer: This helps see the products which are of top quality and high standards, and how we can tailor marketing campaigns for them.
SELECT ProductName, COUNT(ProdCertAcqExpiry) AS [No. of Certifications]
FROM CertifiedProducts
GROUP BY ProductName
HAVING COUNT(ProdCertAcqExpiry) > 1;
--
-- Create View for Uncertified Products
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
ORDER BY COUNT(OrderID) DESC, SUM(ProductRetailPrice) DESC;
--
--
-- USER DEFINED FUNCTION
--
-- UDF 1
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
SELECT dbo.ufn_StateOrders('3') AS [Please enter valid state code];
--
-- UDF 2
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
SELECT dbo.ufn_ProductRetailPrice('Clear') AS [Please enter valid product id or name];
--
-- UDF 3
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
SELECT dbo.ufn_SupplierRenewal(201,7,'1/1/2019') AS [Months left for renewal];
--
--
-- STORED PROCEDURE
--
-- Question: Create a stored procedure that takes a consumer's first and last name and gives the order information for them, separate orders in separate lines.
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
EXEC usp_ConsumerOrders;