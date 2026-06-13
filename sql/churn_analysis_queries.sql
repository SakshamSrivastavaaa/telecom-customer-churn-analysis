 =====================================================
   Customer Churn Analysis - SQL Queries
   Author: Saksham Srivastava
 =====================================================

Query 1: Total Customers
SELECT COUNT(*) AS Total_Customers FROM customer_churn;

Query 2: Total Churned Customers
SELECT COUNT(*) AS Churned_Customers FROM customer_churn WHERE churn = 'Yes';

Query 3: Total Retained Customers
SELECT COUNT(*) AS Retained_Customers FROM customer_churn WHERE Churn = 'No';

Query 4: Churn Rate (%)
SELECT ROUND((COUNT(CASE WHEN Churn='Yes' THEN 1 END) * 100.0) / COUNT(*), 2) AS Churn_Rate FROM customer_churn;

Query 5: Gender-wise Customer Count
SELECT gender, COUNT(*) AS Total_Customers FROM customer_churn GROUP BY gender;

Query 6: Gender-wise Churn
SELECT gender, churn, COUNT(*) AS Customer_Count FROM Customer_churn GROUP BY gender, Churn ORDER BY gender;

Query 7: Contract-wise Churn
SELECT Contract, COUNT(*)AS Total_Customers, SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers FROM customer_churn GROUP BY Contract;

Query 8: Average Monthly Charges
SELECT ROUND(AVG(MonthlyCharges),2) AS Average_Monthly_Charges FROM customer_churn;

Query 9: Average Tenure
SELECT ROUND(AVG(tenure),2) AS Average_Tenure FROM customer_churn;

Query 10: Internet Service Distribution
SELECT InternetService,COUNT(*) AS Total_Customers FROM customer_churn GROUP BY InternetService ORDER BY Total_Customers DESC;

Query 11: Churn by Payment Method
SELECT PaymentMethod,COUNT(*) AS Total_Customers,SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Churn_Rate FROM customer_churn GROUP BY PaymentMethod ORDER BY Churn_Rate DESC;

Query 12: Churn by Internet Service
SELECT InternetService,COUNT(*) AS Total_Customers,SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Churn_Rate FROM customer_churn GROUP BY InternetService ORDER BY Churn_Rate DESC;

Query 13: Average Monthly Charges by Churn Status
SELECT Churn,ROUND(AVG(MonthlyCharges),2) AS Average_Monthly_Charges FROM customer_churn GROUP BY Churn;

Query 14: Average Tenure by Churn Status
SELECT Churn,ROUND(AVG(tenure),2) AS Average_Tenure FROM customer_churn GROUP BY Churn;

Query 15: Contract-wise Revenue
SELECT Contract,ROUND(SUM(MonthlyCharges),2) AS Total_Monthly_Revenue FROM customer_churn GROUP BY Contract ORDER BY Total_Monthly_Revenue DESC;

Query 16: Senior Citizen Analysis
SELECT SeniorCitizen,COUNT(*) AS Total_Customers,SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers FROM customer_churn GROUP BY SeniorCitizen;

Query 17: Top 5 Highest Monthly Charges
SELECT customerID,MonthlyCharges,Contract FROM customer_churn ORDER BY MonthlyCharges DESC LIMIT 5;

Query 18: Customers with Tenure Greater Than 60 Months
SELECT customerID,tenure,Contract,Churn FROM customer_churn WHERE tenure > 60;

Query 19: Contract Types with More Than 1000 Customers
SELECT Contract,COUNT(*) AS Total_Customers FROM customer_churn GROUP BY Contract HAVING COUNT(*) > 1000;

Query 20: Customer Segmentation
SELECT customerID,MonthlyCharges,CASE WHEN MonthlyCharges < 40 THEN 'Low'WHEN MonthlyCharges BETWEEN 40 AND 80 THEN 'Medium' ELSE 'High' END AS Customer_Segment FROM customer_churn;

