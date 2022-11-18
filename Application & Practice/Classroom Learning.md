<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio'><img src="https://user-images.githubusercontent.com/116829793/202769444-abb1003b-ec31-44b6-bfc5-43f2e9beca1f.png" height=50 width=200> </a>
# COMPREHENSIVE UNDERGRADUATE PROGRAM AND STUDENT DEVELOPMENT
## PART 1 - ANALYTICS
<p> Python </p>
As a beginner, I learned the basic usage of Python and enjoyed exploring its use for formatting and statistical purposes. Here are some sample codes I wrote for a class!

<br>
<p> VBA </p>
<br>
<p> R </p>
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



<br>
<p> SQL </p>
<br>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/Application%20%26%20Practice/Classroom%20Learning.md#comprehensive-undergraduate-program-and-student-development'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>

## PART 2 - BUSINESS CORE
### External Business Environment Knowledge
<p> Understanding of legal, political, economic, social factors that affect businesses externally. Importance of knowing and understanding trends and situations in the global economy. Analyzing news pieces, interpreting messages from world leaders etc. </p>
<li> FSEM </li>
<li> WW1 </li>
<br>
<p> Ethics </p>
</li> LGST 2000 </li>
<br>
<p> Using Excel in multiple contexts </p>
<li> Actg 2200 </li>
<li> Actg 2300 </li>
<li> Fin 3200 </li>
<li> Fin 3110 amortization schedule </li>
<li> 2020 project </li>
<br>
<p> Presentation skills - multiple mediums, variety of audience types, learning various tools and techniques, how to be creative </p>
<li> 1010 Presentation </li>
<li> 1010 Infographic </li>
<li> 3140 reports Access </li>
<li> 2300 report </li>
<a href='https://github.com/Ruchita-Raghu/ruchita-raghu-portfolio/blob/main/Application%20%26%20Practice/Classroom%20Learning.md#comprehensive-undergraduate-program-and-student-development'> <img src="https://user-images.githubusercontent.com/116829793/202770254-427e1c4a-1184-4f6c-8a23-73533d674c13.png" height=50 width=230 /> </a>
