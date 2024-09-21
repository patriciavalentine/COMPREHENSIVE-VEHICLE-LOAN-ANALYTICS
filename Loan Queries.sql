SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
LIMIT 10;

-- How many applicants are male, female, or other?
SELECT Gender, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY Gender;

-- What is the distribution of applicants across different states?
SELECT State, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY State
ORDER BY 2 DESC;

-- What is the average age of the applicants?
SELECT ROUND(AVG(Age), 0) AS Avg_age
FROM `Vehicle_Loan_Data.Credit Data`;

-- Which cities have the highest number of loan applicants?
SELECT City, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY City
ORDER BY Applicant_count DESC
LIMIT 3;

-- What is the average credit score of all applicants?
SELECT AVG (`Credit Score`) AS Avg_credit_score
FROM `Vehicle_Loan_Data.Credit Data`;

-- Which applicants have a credit score below 500, and how many are there?
SELECT COUNT(*) AS Low_credit_applicants
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 500;

-- What is the average credit history length (in months) of all applicants?
SELECT AVG(`Credit History Length`) AS Avg_credit_history
FROM `Vehicle_Loan_Data.Credit Data`;

-- What is the relationship between income and credit score?
SELECT CORR(Income, `Credit Score`) AS Income_credit_correlation
FROM `Vehicle_Loan_Data.Credit Data`;

-- What percentage of the applicants have an income greater than ₹100,000?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `Vehicle_Loan_Data.Credit Data`)) AS Percent_high_income
FROM `Vehicle_Loan_Data.Credit Data`
WHERE Income > 100000;

-- Assuming the company is giving out loans at a 15% interest, what profit are they receiving per year?
-- How much revenue are they having?
SELECT SUM(`Loan Amount` * 0.15) AS Total_profit, SUM(`Loan Amount`) AS Total_revenue
FROM `Vehicle_Loan_Data.Credit Data`;

-- What is the total sum of requested loan amounts by applicants from Maharashtra?
SELECT SUM(`Loan Amount`) AS Total_loan_maharashtra
FROM `Vehicle_Loan_Data.Credit Data`
WHERE State = 'Maharashtra';

-- What is the average Loan-to-Value (LTV) Ratio of all applicants?
SELECT AVG(`LTV Ratio`) AS Avg_ltv
FROM `Vehicle_Loan_Data.Credit Data`;

-- Which loans have a Loan Tenure of over 60 months and an LTV ratio greater than 80%?
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Tenure` > 60 AND `LTV Ratio` > 80;

-- What is the distribution of loan amounts requested?
SELECT CASE 
             WHEN `Loan Amount` < 50000 THEN 'Below ₹50,000'
             WHEN `Loan Amount` BETWEEN 50000 AND 100000 THEN '₹50,000 - ₹100,000'
             ELSE 'Above ₹100,000'
          END AS Loan_range,
       COUNT(*) AS Loan_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY Loan_range;

-- What is the average loan tenure for all loans?
SELECT ROUND(AVG(`Loan Tenure`), 0) AS Avg_loan_tenure
FROM `Vehicle_Loan_Data.Credit Data`;

# Employment and Occupation
-- Which employment category has the highest average income?
SELECT `Employment Profile`, ROUND(AVG(`Income`), 2) AS Avg_income
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Employment Profile`
ORDER BY Avg_income DESC;

-- What is the average loan amount requested by applicants in each occupation?
SELECT `Occupation`, ROUND(AVG(`Loan Amount`), 2) AS Avg_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Occupation`
ORDER BY Avg_loan_amount DESC;

# Risk Assessment
-- Which applicants have an LTV ratio above 80% and more than 3 existing loans?
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `LTV Ratio` > 80 AND `Number of Existing Loans` > 3;

-- Which applicants with a credit score below 600 have more than 2 existing loans?
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 600 AND `Number of Existing Loans` > 2;

-- What is the total outstanding loan amount for applicants with more than 5 existing loans?
SELECT SUM(`Loan Amount`) AS Total_outstanding_loan
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Number of Existing Loans` > 5;

-- What is the average loan amount requested by applicants with a credit score below 400?
SELECT ROUND(AVG(`Loan Amount`), 2) AS Avg_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Credit Score` < 400;

-- How many applicants have a profile score above 80 and a credit score above 700?
SELECT COUNT(*) AS count
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Profile Score` > 80 AND `Credit Score` > 700;


# Profitability Analysis
-- What is the total loan amount requested by existing customers vs. new customers?
SELECT `Existing Customer`, SUM(`Loan Amount`) AS Total_loan_amount
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY `Existing Customer`;

-- If an applicant with an income of ₹50,000 requests a loan of ₹500,000, what should be their monthly EMI over a tenure of 60 months (assuming 15% interest)?
WITH Loan_details AS
                  (SELECT 500000 AS principal, 0.15 / 12 AS monthly_rate, 60 AS tenure_months)

SELECT ROUND(principal * monthly_rate * POWER(1 + monthly_rate, tenure_months) / (POWER(1 + monthly_rate, tenure_months) - 1), 2)
      AS monthly_emi
FROM Loan_details;

-- What percentage of applicants with a loan tenure above 36 months have an LTV ratio greater than 85%?
SELECT (COUNT(*) * 100.0 /
                         (SELECT COUNT(*) FROM `Vehicle_Loan_Data.Credit Data` WHERE `Loan Tenure` > 36))
                                 AS percentage
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Tenure` > 36 AND `LTV Ratio` > 85;

-- Which applicants have requested loan amounts more than 4 times their annual income?
SELECT *
FROM `Vehicle_Loan_Data.Credit Data`
WHERE `Loan Amount` > 4 * `Income`;