
# Customer Churn Analysis

## 📌 Project Overview
This project analyzes customer churn to identify why customers leave and what factors influence churn the most.  
Using SQL, Python, and Power BI, the analysis delivers insights that help businesses improve customer retention.

---

## 🗂 Dataset
- Rows: ~7,000+
- Columns: Customer demographics, services, contract type, billing, charges, churn flag.

File used: `data/customer_churn.csv`

---

## 🛠 Tools Used
- SQL (MySQL / PostgreSQL)
- Python (Pandas, Matplotlib, Seaborn)
- Power BI
- Excel

---


## 🗄️ SQL Analysis

All SQL queries used in this project are stored in the file:  
`sql/churn_analysis.sql`

### 🔹 Key SQL Queries

```sql
SELECT
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn;
```

```sql
SELECT
    contract_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY contract_type
ORDER BY churn_rate DESC;
```

```sql
SELECT
    CASE
        WHEN monthly_charges <= 35 THEN 'Low'
        WHEN monthly_charges BETWEEN 35 AND 70 THEN 'Medium'
        ELSE 'High'
    END AS charge_category,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn
GROUP BY charge_category
ORDER BY churned DESC;
```

```sql
SELECT
    CASE
        WHEN tenure <= 12 THEN '0–1 year'
        WHEN tenure BETWEEN 13 AND 36 THEN '1–3 years'
        ELSE '3+ years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn
GROUP BY tenure_group
ORDER BY churned DESC;
```

```sql
SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn
GROUP BY internet_service
ORDER BY churned DESC;
```
