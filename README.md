# 🛒 Ecommerce Sales Insights SQL

## 📈 Project Overview

This project centers around analyzing a comprehensive e-commerce dataset using **SQL** and **Python** to extract meaningful business insights. It integrates data modeling, analytical querying, and visualization to enable informed decision-making across various aspects of online retail operations.

### 🔍 Key Objectives

- ✅ Design and implement a relational database using **PostgreSQL**
- ✅ Clean and explore data with **Python (pandas, seaborn, matplotlib)**
- ✅ Solve real-world business problems using **SQL queries**
- ✅ Visualize key trends and metrics through **EDA & KPIs**
- ✅ Create a comprehensive **Entity-Relationship Diagram (ERD)** to understand the data schema
---

## 📁 Step 2: Folder Structure

<details>
<summary>Click to expand full project structure</summary>

Ecommerce_Sales_Insights_SQL/
│
├── datasets/
│ ├── Raw_data/ # Contains original raw CSV files
│ └── cleaned_data/ # Cleaned and preprocessed data used for analysis
│
├── notebooks/
│ ├── E-Commerce_data_cleaning.ipynb # Data cleaning using pandas
│ ├── EDA_analysis_visualizations.ipynb # Basic EDA Functionality and Graphical EDA using seaborn & matplotlib
│ └── run_sql_queries_and_export_results.ipynb # Running .sql queries and exporting results via Python
│
├── SQL_Database/
│ ├── Defining_the_Tables.sql # PostgreSQL table schema
│ └── load_cleaned_data.py # Python script to load cleaned data into PostgreSQL
│
├── bussiness_queries_result/
│ ├── query_01_top_sellers.sql # SQL queries for business KPIs
│ └── ...query_20_delivery_performance.sql
│ ├── query_01_result_top_sellers.csv # Result CSVs generated via pgAdmin
│ └── ...query_20_result_delivery_performance.csv
│
├── outputs/
│ ├── query_results/ # Result CSVs generated from Python
│ │ ├── query_01_top_sellers_result.csv
│ │ └── ...
│ └── eda_missing_summary/ # Tabular summaries from EDA
│
├── diagrams/
│ └── ERD_E-Commerce.png # Final ERD image
│
└── README.md # Project documentation
