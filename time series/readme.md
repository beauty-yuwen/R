# Time Series
## In this file, all the R work of time series is included. There are several homework and two projects.
### Introduction of time series
In time series we are concerned with data that is observed sequentially. The key issue is not that it is a time or date but rather that the observations are ordered. This order is part of our understanding of the underlying process, and should be part of our solution to questions about the process.

A second data feature of many time series applications is observations are equally spaced. If there are missing observations then we will generally impute these missing observations so that standard methods and softare apply. Solutions should be checked for sensitivity to the imputation.
### About homework
The homework is for familaring with some conceptions and they include data visualization.
### About two projects
#### Project 1  Modeling and Forecast ICE CREAM MANUFACTURING
The time series used is IPN31152N.csv. This time series represents monthly ice cream production for the US since 1972 through 2022. The series is not seasonally adjusted but is indexed to 2017.
Our goals for analyzing this data are
##### Describing and modeling to understand the dynamics of ice cream production
##### Forecasting monthly production through December of 2025
In order to achieve these two goals we need to answer severral questions.
##### Produce descriptive plots and {DISCUSS} what information you glean from each plot.
##### Construct a seasonally adjusted time series by standardizing each month with the mean and standard deviation for that month across all years, and compare to the seasonally adjusted series from FRED, also in the folder as IPN31152S.csv. Use whatever graphs you deem helpful for this comparison (sometimes something simple like a scatterplot with colors for years or months works well your choice). Again be sure and DISCUSS.
##### Develop an appropriate SARIMA model, or trend stationary SARMA model for the original unadjusted series. Justify your model choice using
* Preliminary tests (e.g. unit roots, trend stationary)
* Model selection criteria (eg. AIC, AICc, BIC)
* Diagnostics of standaridized residuals
Be sure and include a discussion not just the plots.
##### Forecast the unadjusted ice cream production series through December of 2025. Comment on the validity of your forecast.
##### AFTER you answer questions 1-4, come back and ANSWER THIS QUESTION.Provide a succinct summary of your findings to address the above goals. Choose as the audience for your paragraph a manager at a company producing ice cream production, or an investment manager who focuses on ice cream, or something similar. For example, these managers WILL NOT CARE ABOUT order selection criteria but will expect that you did you analyst job well and the insight you are providing them is something that they can move forward with profitable decisions for the company. Do include uncertainty bounds in your narrative.
#### Project 2  AR-GARCH Modeling
Financial time series of daily returns may or may not exhibit autocorrelation in the returns themselves, but the variability in the returns as indicated by either the absolute or squared value of the daily returns will exhibit strong autocorrelation. In other words, the volatility or variance of the time series is also important to capture. The GARCH models provide one mechanism to model the volatility of the returns in addition to the returns themselves. From an investors perspective, estimates and forecast of the volatility play an important role in pricing models, especially options written on the underlying stocks.
##### Produce the following plots
* Plot of adjusted daily closing price
* Plot of daily log returns based on the adjusted daily closing price
* ACF and PACF of log returns
* ACF and PACF of squared log returns
##### Using the fGarch package, and the command garchFit, fit an ARMA(1,0)+GARCH(1,0) assuming a normal distribution.
##### Repeat question 2 but include a GARCH(2,0) component.
##### Repeat question 2 but include any other model features you think might be important. You can use your judgement and do not need to go through an extensive model selection process.
##### Produce forecasts for the next 5 days (one trading week) of both the return level and the standard deviation.
##### Summarize your findings assuming model is PERFECT. Comment on what the model tells you and the forecasts obtained.
##### Provide a high-level executive summary with at MOST two plots that describes the volatiity patterns observed in the Dow Jones Index, and your ability to forecast the volatility one, two and twenty days ahead.
