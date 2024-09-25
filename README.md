# 📊 VEHICLE LOAN ANALYTICS
In this project, I delved into a detailed analysis of a vehicle loan dataset for an Asset Financing Company.

I performed an extensive analysis of the dataset using `BigQuery` to run a significant number of SQL queries.
In the analysis, I explored key areas such as demographics, financial stability, employment trends, risk assessment, and profitability.
Then finally, I visualized the findings in `Looker Studio`, enabling data-driven strategic decisions for optimizing loan offerings and managing risks effectively.

# Uncovering Patterns in Vehicle Loan Data
## 🧑‍💻 Project Overview
I analyzed the demographics of loan applicants, including age, gender, and geographic spread, to gain insights for targeted marketing.
Then I assessed the financial well-being of the applicants by examining their credit scores, income disparities, and correlations between income and credit scores to identify high-risk profiles.

Employment trends were then explored to understand their impact on loan amounts. Then finally, I conducted a profitability analysis by comparing loan requests from existing and new customers and evaluating interest rate scenarios for potential returns.

>This project ultimately helps the Asset Financing Company better understand their customer base and optimize loan offerings for profitability while minimizing risk.

### 📁 The Files
1. [The Dataset](https://storage.cloud.google.com/vehicle_loan_data/Vehicle%20Loan%20Dataset.csv).
2. [The BigQuery SQL Queries](https://github.com/patriciavalentine/LOAN-DATA-QUERIES-AND-VISUALS/blob/main/Loan%20Queries.sql).
3. [The Looker Visualizations](https://github.com/patriciavalentine/LOAN-DATA-QUERIES/blob/main/VEHICLE_LOANS_VISUALIZATIONS.pdf).

### 🛠️Tools Used
- **The Google Cloud Storage**: Stored the vehicle loan dataset for secure, scalable, and efficient data handling.
- **BigQuery**: Ran a series of SQL queries on the loan dataset to derive insights.
- **Looker Studio**: Created dynamic, interactive visualizations of the analyzed data, enabling deeper insights.


### Sample of the Dataset:
![Loan Data - Sample](https://github.com/user-attachments/assets/6b1f1212-aae8-4796-9398-97ae4987e6b9)
*Source - [Kaggle](https://www.kaggle.com/datasets/yashkmd/credit-profile-two-wheeler-loan-dataset)!*


# THE SQL 📈 QUERIES & RESULTS
![loan-approved-application-form-concept](https://github.com/user-attachments/assets/d38c9251-954a-4983-8be4-9ba40c4e40ac)

## 1. 👪 Demographics Analysis
In this section, I analyzed gender distributions, calculated the average age of loan applicants,  and explored the geographic spread of applicants across states and cities. This analysis helped in understanding the demographics of the loan applicants, which is crucial for targeted marketing.

### Question 1:
**How many applicants are male, female, or other?**
```sql
SELECT Gender, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY Gender;
```
![By Gender](https://github.com/user-attachments/assets/fd89b7a8-e3aa-48e2-95d8-4dc7950a1c2a)


### Question 2:
**What is the distribution of applicants across different states?**
```sql
SELECT State, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY State
ORDER BY 2 DESC;
```
![By State](https://github.com/user-attachments/assets/1f7524ca-d2b3-4dcf-946d-821a4b344a79)


### Question 3:
**What is the average age of the applicants?**
```sql
SELECT ROUND(AVG(Age), 0) AS Avg_age
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Avg Age](https://github.com/user-attachments/assets/c9fba08b-6d3c-4ac8-bdd9-136159146ed5)


### Question 4:
**Which cities have the highest number of loan applicants?**
```sql
SELECT City, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY City
ORDER BY Applicant_count DESC
LIMIT 3;
```
![Top 3 Cities](https://github.com/user-attachments/assets/96dd1df7-260c-44f9-a719-83f1f80bbac0)


## 2. 💸 Financial Stability
I conducted a thorough examination of the financial stability of applicants by calculating average credit scores and identifying those with low credit scores.
Additionally, I analyzed income disparities among applicants to understand their financial backgrounds better.

Furthermore, I investigated correlations between income and credit scores to identify high-risk profiles, such as applicants with low income and poor credit histories.
I also analyzed loan requests by breaking down the average loan tenure and Loan-to-Value (LTV) ratios, particularly focusing on high-risk loans where the LTV exceeds 80%.

### Question 1:
**What is the average credit score of all applicants?**
```sql
SELECT AVG (`Credit Score`) AS Avg_credit_score
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Avg Credit score](https://github.com/user-attachments/assets/4482034e-b0c3-4f4a-b9b4-96430476c907)


### Question 2:
**Which applicants have a credit score below 500, and how many are there?**
```sql
SELECT COUNT(*) AS Low_credit_applicants
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 500;
```
![Low credit applicants](https://github.com/user-attachments/assets/f0688232-fc46-447c-bd20-0dfc13dc4e90)


### Question 3:
**What is the average credit history length (in months) of all applicants?**
```sql
SELECT AVG(`Credit History Length`) AS Avg_credit_history
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Avg Credit history](https://github.com/user-attachments/assets/8631bb43-c989-47e5-bda9-b48c1a8622a8)


### Question 4:
**What is the relationship between income and credit score?**
```sql
SELECT CORR(Income, `Credit Score`) AS Income_credit_correlation
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Income Credit Correlation](https://github.com/user-attachments/assets/e9b12576-d8a7-4b70-92f3-6c976d31c77d)


### Question 5:
**What percentage of the applicants have an income greater than ₹100,000?**
```sql
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `Vehicle_Loan_Data.Credit Data`)) AS Percent_high_income
FROM `Vehicle_Loan_Data.Credit Data`
WHERE Income > 100000;
```
![% High Income](https://github.com/user-attachments/assets/1005e34f-8463-4d9d-bb88-b30693ae9966)


### Question 6:
**Assuming the company is giving out loans at a 15% interest, what profit are they receiving per year?**

**How much revenue are they having?**
```sql
SELECT SUM(`Loan Amount` * 0.15) AS Total_profit, SUM(`Loan Amount`) AS Total_revenue
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Profit   Revenue](https://github.com/user-attachments/assets/3b815626-b8c8-49d8-840b-eaa60174c320)


### Question 7:
**What is the total sum of requested loan amounts by applicants from Maharashtra?**
```sql
SELECT SUM(`Loan Amount`) AS Total_loan_maharashtra
FROM `Vehicle_Loan_Data.Credit Data`
WHERE State = 'Maharashtra';
```
![Total loan in Maharashtra](https://github.com/user-attachments/assets/590b1745-b79b-4705-9c57-01be35cc51e4)


### Question 8:
**What is the average Loan-to-Value (LTV) Ratio of all applicants?**
```sql
SELECT AVG(`LTV Ratio`) AS Avg_ltv
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Avg LTV](https://github.com/user-attachments/assets/52e38253-42e5-4059-9979-489fbd99ad4f)


### Question 9:
**Which loans have a Loan Tenure of over 60 months and an LTV ratio greater than 80%?**
```sql
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Tenure` > 60 AND `LTV Ratio` > 80;
```

### Question 10:
**What is the distribution of loan amounts requested?**
```sql
SELECT CASE 
             WHEN `Loan Amount` < 50000 THEN 'Below ₹50,000'
             WHEN `Loan Amount` BETWEEN 50000 AND 100000 THEN '₹50,000 - ₹100,000'
             ELSE 'Above ₹100,000'
          END AS Loan_range,
       COUNT(*) AS Loan_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY Loan_range;
```
![Loan range   count](https://github.com/user-attachments/assets/fe7f4b8f-d015-4847-a6b8-8441e3cdecd6)



### Question 11:
**What is the average loan tenure for all loans?**
```sql
SELECT ROUND(AVG(`Loan Tenure`), 0) AS Avg_loan_tenure
FROM `Vehicle_Loan_Data.Credit Data`;
```
![Avg Loan Tenure](https://github.com/user-attachments/assets/9b6240f3-ee34-4539-90a3-a5c6e70bb971)



## 3. 👩‍💼 Employment and Occupation Trends
Using SQL queries, I explored employment and occupation-related trends to determine which employment categories and occupations request higher loan amounts.
This analysis is essential for understanding how employment types influence loan requests and associated risks.

### Question 1:
**Which employment category has the highest average income?**
```sql
SELECT `Employment Profile`, ROUND(AVG(`Income`), 2) AS Avg_income
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Employment Profile`
ORDER BY Avg_income DESC;
```
![Employment Profile Vs Income](https://github.com/user-attachments/assets/f5552631-bd45-4dbb-ae98-79e46da2cebd)



### Question 2:
**What is the average loan amount requested by applicants in each occupation?**
```sql
SELECT `Occupation`, ROUND(AVG(`Loan Amount`), 2) AS Avg_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Occupation`
ORDER BY Avg_loan_amount DESC;
```
![Occupation Vs Loan amount](https://github.com/user-attachments/assets/8232e1d4-c9d0-4ef2-b85c-d58667b1067a)



## 4. ⚠️ Risk Assessment
Risk assessment is another critical focus of this project.

This is where I identified applicants with multiple existing loans and high LTV ratios that may pose significant risks.
By analyzing these factors, I aimed to provide insights into which applicants may be more likely to default on their loans.

### Question 1:
**Which applicants have an LTV ratio above 80% and more than 3 existing loans?**
```sql
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `LTV Ratio` > 80 AND `Number of Existing Loans` > 3;
```

### Question 2:
**Which applicants with a credit score below 600 have more than 2 existing loans?**
```sql
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 600 AND `Number of Existing Loans` > 2;
```

### Question 3:
**What is the total outstanding loan amount for applicants with more than 5 existing loans?**
```sql
SELECT SUM(`Loan Amount`) AS Total_outstanding_loan
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Number of Existing Loans` > 5;
```
![total outstanding loan amount for applicants with more than 5 existing loans](https://github.com/user-attachments/assets/177fd899-3c37-4385-ab3e-5c79236216b6)



### Question 4:
**What is the average loan amount requested by applicants with a credit score below 400?**
```sql
SELECT ROUND(AVG(`Loan Amount`), 2) AS Avg_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 400;
```
![average loan amount requested by applicants with a credit score below 400](https://github.com/user-attachments/assets/172d2a8a-dd78-4682-a592-b9cb540132a3)


### Question 5:
**How many applicants have a profile score above 80 and a credit score above 700?**
```sql
SELECT COUNT(*) AS count
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Profile Score` > 80 AND `Credit Score` > 700;
```
![How many applicants have a profile score above 80 and a credit score above 700](https://github.com/user-attachments/assets/1836cac2-30e8-42de-b552-947a9a742785)



## 5. 📈 Profitability Analysis
I examined the loan requests of existing customers versus new customers and calculated profitability scenarios based on loan amounts and interest rates.
This analysis helps understand the potential returns from different customer segments.

### Question 1:
**What is the total loan amount requested by existing customers vs. new customers?**
```sql
SELECT `Existing Customer`, SUM(`Loan Amount`) AS Total_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Existing Customer`;
```
![What is the total loan amount requested by existing customers vs  new customers](https://github.com/user-attachments/assets/97c19ae8-1b04-42ea-b08d-1727e98a47c0)


### Question 2:
**If an applicant with an income of ₹50,000 requests a loan of ₹500,000, what should be their monthly EMI over a tenure of 60 months (assuming 15% interest)?**
```sql
WITH Loan_details AS
                  (SELECT 500000 AS principal, 0.15 / 12 AS monthly_rate, 60 AS tenure_months)

SELECT ROUND(principal * monthly_rate * POWER(1 + monthly_rate, tenure_months) / (POWER(1 + monthly_rate, tenure_months) - 1), 2)
      AS monthly_emi
FROM Loan_details;
```
![If an applicant with an income of ₹50,000 requests a loan of ₹500,000, what should be their monthly EMI over a tenure of 60 months (assuming 15% interest)](https://github.com/user-attachments/assets/0be05016-b969-425f-8724-b29571f9dba9)


### Question 3:
**What percentage of applicants with a loan tenure above 36 months have an LTV ratio greater than 85%?**
```sql
SELECT (COUNT(*) * 100.0 /
                         (SELECT COUNT(*) FROM `Vehicle_Loan_Data.Credit Data` WHERE `Loan Tenure` > 36))
                                 AS percentage
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Tenure` > 36 AND `LTV Ratio` > 85;
```
![What percentage of applicants with a loan tenure above 36 months have an LTV ratio greater than 85%](https://github.com/user-attachments/assets/f541aad8-1843-44a2-a021-df59e393daa2)


### Question 4:
**Which applicants have requested loan amounts more than 4 times their annual income?**
```sql
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Amount` > 4 * `Income`;
```


# 📊 Visualizations in Looker Studio
To accompany the insights derived from the analysis, I created visualizations in Looker Studio.

![Vehicle Loan Dashboard](https://github.com/user-attachments/assets/1108abe8-9ee2-46b2-8c34-b33790538bb0)

To view the Dashboard in Looker Studio, click [here](https://lookerstudio.google.com/reporting/d8eccb89-1dc5-4f6c-a001-34c2611801ac).

These visual representations of complex data patterns illustrate customer behavior, risk profiles, and loan distributions, supporting strategic business decisions and enhancing the overall understanding of the data.

## Conclusion
This comprehensive analysis of the vehicle loan dataset has provided invaluable insights into applicants' profiles, their financial health, and the dynamics of loan performance within the Asset Financing sector.

By leveraging key inquiry questions, I was able to explore various dimensions of the data, including demographic trends, creditworthiness, and the distribution of loan amounts.
Thus, the insights derived from this project would offer a strategic foundation for the company to refine its lending practices and risk assessment procedures, which would then empower the company to navigate the complexities of the vehicle loan market, enhance competitiveness, and foster its long-term growth.

> `KINDLY NOTE`: For a detailed explanation of these query results, check [here](https://valepatricia16.wixsite.com/patricia-valentine/about-3-2).

## THE END!
### Thank you.
