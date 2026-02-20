-- Total customer count
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total churn count
SELECT COUNT(*) AS total_churn
FROM customers
WHERE Churn = 'Yes';

-- Churn rate
SELECT
  (SUM(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS churn_rate
FROM customers;

-- Churn by gender
SELECT Gender, COUNT(*) AS churn_count
FROM customers
WHERE Churn = 'Yes'
GROUP BY Gender;

-- Churn by contract type
SELECT Contract, COUNT(*) AS churn_count
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract;

-- Churn by payment method
SELECT PaymentMethod, COUNT(*) AS churn_count
FROM customers
WHERE Churn = 'Yes'
GROUP BY PaymentMethod;

-- Churn by tenure groups
SELECT
  CASE 
    WHEN Tenure < 12 THEN '0–1 year'
    WHEN Tenure BETWEEN 12 AND 24 THEN '1–2 years'
    WHEN Tenure BETWEEN 25 AND 48 THEN '2–4 years'
    ELSE '4+ years'
  END AS tenure_group,
  COUNT(*) AS churn_count
FROM customers
WHERE Churn = 'Yes'
GROUP BY tenure_group;

-- High-risk customer segments
SELECT SeniorCitizen, InternetService, COUNT(*) AS churn_count
FROM customers
WHERE Churn = 'Yes'
GROUP BY SeniorCitizen, InternetService;
