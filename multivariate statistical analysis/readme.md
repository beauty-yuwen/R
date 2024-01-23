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
* duration：        Last contact duration in second
* campaign：      Number of contacts performed during this campaign and for this client
* pdays： Number of days that passed by after the client was last contacted from a previous
campaign
* previous： Number of contacts performed before this campaign and for this client
* poutcome： Outcome of the previous marketing campaign
* y： Whether the surveyed client has subscribed a term deposit?

According to the data description, all variables are categorical variables except for ‘age’, ‘balance’, and ‘duration’, which are continuous variables.
#### Data Pre-Processing and Data Cleaning
In this part, I did data pre-processing and data cleaning. I considered missing values and unbalanced data. Besides, I also seperate the data set as training dataset and testing dataset.
#### Logistic Regression
From the data description, it is clear that the response variable used in this report is a dichotomous variable. Logistic regression was first considered to build the model.
The steps of using logistoic regression to
build the model are as follows:
* Deal with the dichotomous variable. Give the data exact numbers.
* It is not possible to fit this discretevariable directly, but to fit the conditional
probability.
* A generalized linear model is used to calculate this conditional probability.
* Build the final linear model. However, It is not enough to just build such a linear model.

However, It is not enough to just build such a linear model. To simplify the model, we should also explore the correlation between the independent variables. Therefore, in this report, principal
component analysis was again used to choose the independent variables.

After getting the model, this report tests the GLM model on the testing data set. By
showing a ROC,the precision can be seen clearly.
#### Discriminant Analysis(Distance discrimination+Bayesian discrimination)
Discriminant analysis is also known as Linear Discriminant Analysis (LDA). It is a
statistical method that uses samples of known categories to build a discriminant model to discriminate samples of unknown categories. Its basic steps are:
* Determine the category of the explanatory variables
* Choose the discriminant method, including distance discriminant, Fisher discriminant, etc.
* Build the model according to the discriminant method
* Prediction

After getting the model, this report tests the model on the testing data set. By
showing the confusion matrix,the precision can be seen clearly.
#### Model Improvement
The accuracy of prediction using the discriminant analysis is not very satisfactory. So I also use decision trees again for classification learning, so that it can improve the model. Decision trees are an algorithm for solving classification problems.(which is appropriate for solving this problem of
whether the clients will subscribe the product). The decision tree algorithm uses a tree-like structure and uses layers of inference to achieve the final classification.
In prediction, a judgment is made at the inner node of the tree with a certain attribute value, and according to the judgment result, it decides which branch node to enter until it reaches the leaf node
to get the classification result.

## All results mentioned before will be shown in RMD file.

