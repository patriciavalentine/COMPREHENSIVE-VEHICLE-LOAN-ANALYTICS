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
GROUP BY State;

-- What is the average age of the applicants?
SELECT AVG(Age) AS Avg_age
FROM `Vehicle_Loan_Data.Credit Data`;

-- 
SELECT City, COUNT(*) AS Applicant_count
FROM `Vehicle_Loan_Data.Credit Data`
GROUP BY City
ORDER BY Applicant_count DESC
LIMIT 1;



