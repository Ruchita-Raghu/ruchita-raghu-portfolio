<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio'><img src="https://user-images.githubusercontent.com/116829793/202769444-abb1003b-ec31-44b6-bfc5-43f2e9beca1f.png" height=50 width=200> </a>
# COMPREHENSIVE UNDERGRADUATE PROGRAM AND STUDENT DEVELOPMENT
## PART 1 - ANALYTICS
#### Python
As a beginner, I learned the basic usage of Python and enjoyed exploring its use for formatting and statistical purposes. Here are some sample codes I wrote for a class!
<br>
 <img src="https://user-images.githubusercontent.com/116829793/202882629-7d941f51-69d8-4437-ad00-86c9018fa2b4.png"> 
 
 <img src="https://user-images.githubusercontent.com/116829793/202882852-231c5cbb-522a-454e-85fa-eb11841132f9.png"> 
 <img src="https://user-images.githubusercontent.com/116829793/202882928-8384e8d5-d2c2-4dbb-bc08-2edfe6b9d43f.png">
 <img src="https://user-images.githubusercontent.com/116829793/202882992-55f5641d-e559-4b8b-ab77-15a0cd9d8229.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883196-a5b0a81a-6004-42db-895d-2fcdc37273c8.png">

 <img src="https://user-images.githubusercontent.com/116829793/202883282-a3946fe2-4ca1-4245-adb3-0eda00e767d9.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883296-d5b6b309-12ea-47bc-b7cc-cf07bb8b73f9.png">

 <img src="https://user-images.githubusercontent.com/116829793/202883338-70cef745-b0e9-4439-90f3-bccdef0f2da8.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883342-6c101033-1a49-4881-83b4-3f3dff760ede.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883460-5f452047-90ab-41bb-8a38-54709b98fad0.png">

 <img src="https://user-images.githubusercontent.com/116829793/202883708-7bbd3b2a-079c-46b5-8b73-96ee0015d4c8.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883789-e5dc55c5-439a-4724-bb0f-378ae9bc9ee7.png">
 <img src="https://user-images.githubusercontent.com/116829793/202883988-7a3668b1-2534-4543-939e-4a97d2f062d4.png">

 <img src="https://user-images.githubusercontent.com/116829793/202884213-66dc0ed0-3244-498d-bb5f-f34db0a07c3a.png">
 <img src="https://user-images.githubusercontent.com/116829793/202884294-194176aa-ad6a-438b-ab09-1c21f5898284.png">
 <img src="https://user-images.githubusercontent.com/116829793/202884491-bcf4e153-07ec-4d3f-bb63-0f1635c5b98c.png">



#### VBA

Visual Basic was used for us to understand how to code within Excel. I was introduced to the basics of the syntax.
 <img src="https://user-images.githubusercontent.com/116829793/202823827-a66ba6af-f6cf-498d-8f8b-85b1e5e47f44.png" width=500> 
 <img src="https://user-images.githubusercontent.com/116829793/202823920-29165bdb-0fa3-44e1-95da-2ae1baf96b6b.png"> 
 
 
<p> <b> For building a mortgage schedule: </b> </p>
 <img src="https://user-images.githubusercontent.com/116829793/202824085-0c40ba39-0a6d-4141-b3ba-38204e20ec55.png"> 
 <img src="https://user-images.githubusercontent.com/116829793/202824146-9833785b-80d6-4484-ba53-2acd6e1a17d8.png"> 
 

#### R
The use of R was for a financial modelling class that I took. In addition to learning the language and its syntax, I explored different uses in applying it for portfolio optimization and analyzing stocks. Packages I worked with were data.table, tseries, fPortfolio, PortfolioAnalytics, PerformanceAnalytics, xts etc. Here are samples of code I wrote - 
<pre> <b> # Get the stock prices </b>
            tickers <- c("BAC", "INTC", "KO", "DIS", "CAT", "AXP")
            getSymbols(tickers, from = "2016-10-31", to = "2021-10-31", src = "yahoo")
 <b> # Adjusted Prices </b>
            BAC.adj<-BAC[,6] 
            INTC.adj<-INTC[,6]
            KO.adj<-KO[,6]
            DIS.adj<-DIS[,6]
            CAT.adj<-CAT[,6]
            AXP.adj<-AXP[,6] 
 <b> # monthly returns </b>
            bac.rets <- monthlyReturn(BAC.adj)
            intc.rets <- monthlyReturn(INTC.adj)
            ko.rets <- monthlyReturn(KO.adj)
            dis.rets <- monthlyReturn(DIS.adj)
            cat.rets <- monthlyReturn(CAT.adj)
            axp.rets <- monthlyReturn(AXP.adj)
 <b> # Monthly returns dataset </b>    
            allmonthlyret <- cbind(bac.rets, intc.rets, ko.rets, dis.rets, cat.rets, axp.rets)
            colnames(allmonthlyret) <- tickers 
 <img src="https://user-images.githubusercontent.com/116829793/202780854-a85a8449-a17d-483b-b276-957fc75fb80c.png" width=500> 
 <b> plotting prices </b>
            plot.xts(BAC.adj["2017", ], main = "Bank of America Only 2017 Prices")
  <img src="https://user-images.githubusercontent.com/116829793/202781612-3619b2b3-b796-4654-a727-f6f81d8088cb.png" width=500> 
 <b> Monthly returns used to get Minimum Variance Portfolio </b>
            allmonthlyret <- na.omit(allmonthlyret)
            nassets <- ncol(allmonthlyret)
            allmonthlyret <- timeSeries(allmonthlyret)
            my.specs <- portfolioSpec()
            my.const <- "LongOnly"
            minvar <- minvariancePortfolio(data = allmonthlyret, spec = my.specs, constraints = my.const)
            minvar
            minvar.weights <- getWeights(minvar)
            barplot(minvar.weights, col = terrain.colors(nassets), main = "Min Variance Weights", ylab = "Percentage", xlab = "Stocks")
  <img src="https://user-images.githubusercontent.com/116829793/202782289-4787deb2-d7ef-4ffb-9d6a-46507986db60.png" height=250 width=400>
  <img src="https://user-images.githubusercontent.com/116829793/202782420-447c192d-cdc7-4860-a338-23d3feb57f40.png" width=500> 
  <b> # Analysis codes </b>
            annualret <- getTargetReturn(minvar)[1]*12
            annualrisk <- getTargetRisk(minvar)[2]*sqrt(12)
  <b> # Effcient Frontier Set </b> 
            my.specs <- portfolioSpec()
            efctfrontset <- portfolioFrontier(allmonthlyret)
            efctfront.weights <- getWeights(efctfrontset)
            barplot(t(efctfront.weights), main = "Efficient Frontier Weights", col = rainbow(nassets), xlab = "Portfolios", ylab = "Weights")
            plot.fPORTFOLIO(efctfrontset, which = c(1,2,3,5))
   <img src="https://user-images.githubusercontent.com/116829793/202783315-d906895c-db58-4943-a70b-5216ee3ae2e9.png" width=500>         
   <img src="https://user-images.githubusercontent.com/116829793/202783544-c14394c4-0f65-4855-8913-1d51da36d527.png" width=500> 
   <b> # Setting Constraints for Portfolios </b> 
            my.specs <- portfolioSpec()
            const14 <- c("eqsumW[c(2,4)]=0.40", "minsumW[c(5,6)]=0.20", "maxsumW[c(5,1)]=0.30")
            optimal.combined <- tangencyPortfolio(data = allmonthlyret, spec = my.specs, constraints = const14)
            optimal.combined.weights <- getWeights(optimal.combined) </pre>




#### SQL
Extensive exposure to using SQL and T-SQL in Access databases and on SQL Server/Visual Studio applications. SQL used to create databases, data marts, query databases etc.
Explore the database managemnt work here!

<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/Application%20%26%20Practice/Classroom%20Learning.md#comprehensive-undergraduate-program-and-student-development'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>

## PART 2 - BUSINESS CORE
### External Business Environment Knowledge
<p> Soon in the business program I understood how the business is affected by legal, political, economic, social factors externally. I realized the importance of knowing trends and situations in the global economy. It is crucial for every professional to be able to read and analyze news pieces, interpreting messages from world leaders, keep track of current happenings etc. I grasped a lot of knowledge from my non-business classes about what one should be aware of. </p>
<p> I took several classes which enhanced my communication, global awareness, general knowledge, problem solving, and critical thinking skills. </p>
These are some classes I took - 
<li> Political Science - America, China, and Competition for Global Leadership </li>
<li> World Language - French </li>
<li> Sustainability </li>
<li> History - World War I </li>
<li> Geography - Global Environment Change </li>
<li> Art History - Images of Culture: Islamic Art and Architecture </li>

<p> Find some of my work from here! </p>

<br>
<p> The business core classes at Daniels prepare a student to face the business world with a strong foundation. No matter what our major is, we take classes in different areas to gain a knowledge about the necessary aspects of life. The classes surround basics of every business field a student should know. Starting from marketing to finance, accounting to ethics, legal studies to analytics, management to communication, professional development to industrial revolution, and even math! </p>
<p> One of the biggest skills I have picked up is using tools across multiple fields. For example, here are some examples of using Microsoft Excel for different business classes - </p>
<li> Introduction to Accounting </li>
<li> Managerial Accounting for Decision Making </li>
<li> Corporate Financial Problems </li>
<li> Financial Markets & Institutions </li>
<li> Analytics </li>
<br>
<p> Several Presentation skills - multiple mediums, variety of audience types, learning various tools and techniques, how to be creative </p>
<li> 1010 Presentation </li>
<li> 1010 Infographic </li>
<li> 3140 reports Access </li>
<li> 2300 report </li>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/Application%20%26%20Practice/Classroom%20Learning.md#comprehensive-undergraduate-program-and-student-development'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>
