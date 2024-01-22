# Multivariate Statistical Analysis
## In this file, all of the Mltivariate Statistical Analysis R work I did in my graduate study is included. The course description is as follows:
In many data collection scenarios, a large number of variables are collected for each observational unit. The main approach to analyze such data is dimension reduction. This course focuses on general methods and specific models and eschews algorithmic considerations in favor of the use of algorithms for data analysis. 
## Main goals of this course:
#### Learn how to apply geometric methods to reduce dimension in Euclidean space.
#### Learn how to apply dimention methods to raw data matrices and similarity matrices.
#### Learn techniques for clustering and discriminations.
#### Apply the methods learned in data analysis.
This course also has a final project.
## Description of final project
#### The tile of my report is Research on the Prediction of unsubscription rate of bank term deposit products Based on Logistic Regression and Discriminant Analysis.
#### Research Background
With the further development of the global economic level, the pressure of competition among enterprises has further increased. Unlike other businesses, commercial banks are intermediary organizations, which are financial institutions capable of providing deposit and loan operations. Deposits are the main source of funds for commercial banks. Therefore, in order to enhance their competitiveness, banks are working to attract new users to buy the bank's term deposit products while retaining their old customers. This report will explore this behavior and examine what factors influence customers' decision, and predict whether they will buy this product or not. This can certainly help banks to target their customers, reduce the pressure on the business and stand out
from the competition.
#### Research methods and framework
This report begins with a macro analysis of each influencing factor. The factors that are generally considered to be more influential are also broadly screened according to their respective meanings. After that, the screened factors are further analyzed. To ensure the accuracy of the research results, two multivariate analysis methods are used in this report to achieve the research objectives. First, Build a linear regression model using logistic regression and test the predictive
accuracy of this model. In addition, this report uses discriminant analysis to determine the impact of these factors on product backorder rates and also tests the predictive accuracy of this method. Finally, the two methods are compared and the method with higher prediction accuracy is selected. Futhermore, this report also uses decision tree to improve the model.
#### Data Description
For this project, I chose the bank marketing dataset. The data is related to the direct marketing activities of a Portuguese banking institution. It is used to predict whether a customer will subscribe the term deposit product or not. There are 45211 data and 16 variables in this dataset and all data are sorted by date. 
* age：        Age of surveyed clients
* job：            Job type of surveyed clients
* marital：         Marital status of clients
* education：     Educational level of clients
* default：     Whether the surveyed client has a record of default
* balance：         Balance the clients have
* housing：     Whether the surveyed client has housing loan
* loan：     Whether the surveyed client has personal loan
* contact：         Contact communication type
* month：       Last contact month of year
* duration：        Last contact duration in seconds
* campaign：      Number of contacts performed during this campaign and for this client
* pdays： Number of days that passed by after the client was last contacted from a previous
campaign
* previous： Number of contacts performed before this campaign and for this client
* poutcome： Outcome of the previous marketing campaign
* y： Whether the surveyed client has subscribed a term deposit?



