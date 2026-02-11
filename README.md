# 🏢 Enterprise Data Warehouse Project

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat\&logo=microsoft-sql-server\&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-003B57?style=flat\&logo=database\&logoColor=white)](https://docs.microsoft.com/en-us/sql/t-sql/)
[![Architecture](https://img.shields.io/badge/Architecture-Medallion%20\(Bronze/Silver/Gold\)-FF6F00?style=flat)]()
[![Data Model](https://img.shields.io/badge/Data%20Model-Star%20Schema-blueviolet?style=flat)]()

> A production-ready SQL Server Data Warehouse implementing the **Medallion Architecture (Bronze → Silver → Gold)** with automated ETL pipelines, data quality framework, dimensional modeling, and business-ready analytics.

---

## 📌 Project Overview

This project demonstrates the end-to-end design and implementation of an **Enterprise Data Warehouse** that integrates data from multiple operational systems (CRM & ERP) and transforms raw data into analytical insights.

The solution follows industry best practices in:

* Data Engineering
* Dimensional Modeling (Kimball Methodology)
* Data Quality Management
* ETL Pipeline Design
* Analytical Reporting

---

## 🏗 Architecture

The warehouse follows the **Medallion Architecture pattern**, organizing data into three logical layers:

### 🥉 Bronze Layer – Raw Data

* Stores raw data exactly as received from source systems
* No transformations applied
* Full load using `BULK INSERT`
* Preserves historical data

### 🥈 Silver Layer – Cleansed & Standardized

* Data cleaning and validation
* Deduplication using `ROW_NUMBER()`
* Standardization of codes (Gender, Marital Status, Country, Product Line)
* Date conversions and validation
* Derived columns and enrichment logic

### 🥇 Gold Layer – Business-Ready Model

* Star Schema design
* Conformed dimensions
* Fact table at order-line grain
* Analytical views for reporting
* SCD Type 2 handling for product dimension

---

## 🔄 Data Sources

The warehouse integrates data from two systems:

### CRM System

* `crm_cust_info` – Customer demographics
* `crm_prd_info` – Product master data
* `crm_sales_details` – Sales transactions

### ERP System

* `erp_cust_az12` – Additional customer attributes
* `erp_loc_a101` – Customer location data
* `erp_px_cat_g1v2` – Product category hierarchy

---

## 📊 Data Model (Star Schema)

### Dimensions

#### `gold.dim_customers`

* Surrogate Key
* Customer ID & Business Number
* Name, Gender, Marital Status
* Country
* Birthdate
* Create Date

#### `gold.dim_products` (SCD Type 2)

* Surrogate Key
* Product ID & Number
* Category & Subcategory
* Product Line
* Maintenance Flag
* Cost
* Effective Start Date

### Fact Table

#### `gold.fact_sales`

* Order Number
* Product Key (FK)
* Customer Key (FK)
* Order Date
* Shipping Date
* Due Date
* Sales Amount
* Quantity
* Price

**Grain:** One row per order line item

---

## ⚙ ETL Pipeline

Two main stored procedures power the ETL process:

### `bronze.load_bronze`

* Truncate & load pattern
* `BULK INSERT` from CSV
* Execution logging
* TRY/CATCH error handling

### `silver.load_silver`

* Data cleansing & transformation
* Deduplication logic
* Data standardization
* Window functions (`LEAD`, `ROW_NUMBER`)
* Business rule enforcement

---

## 🔎 Data Quality Framework

The project applies structured data quality controls:

* **Completeness:** NULL handling and default values
* **Consistency:** Standardized codes and mappings
* **Validity:** Date validation and range checks
* **Uniqueness:** Duplicate removal strategy
* **Accuracy:** Sales recalculation (Quantity × Price)

---

## 📈 Analytics & Reporting

### Customer Report (`gold.report_customers`)

* Customer Segmentation (VIP / Regular / New)
* Total Sales & Orders
* Average Order Value (AOV)
* Customer Lifespan & Recency
* Age Groups

### Product Report (`gold.report_products`)

* Product Performance Segmentation
* Revenue by Product
* Average Selling Price
* Monthly Revenue Metrics

### Exploratory Data Analysis

* Revenue by category
* Top/Bottom customers
* Top/Bottom products
* Sales distribution by country

---

## 🛠 Technologies Used

* Microsoft SQL Server 2019+
* T-SQL
* SQL Server Management Studio (SSMS)
* Medallion Architecture
* Star Schema Modeling
* SCD Type 2 Implementation

---

## 🚀 How to Run the Project

1. Create Database and Schemas
2. Run Bronze DDL scripts
3. Execute `bronze.load_bronze`
4. Run Silver DDL scripts
5. Execute `silver.load_silver`
6. Create Gold Views
7. Query analytics views

---

## ⭐ Key Highlights

* End-to-end Data Warehouse implementation
* Multi-source data integration
* Production-style ETL with logging
* Advanced SQL techniques (CTEs, Window Functions)
* Business-ready analytical reporting
* Clean separation of data layers

---

## 🔮 Future Improvements

* Incremental loading (CDC)
* Power BI dashboards
* Index & performance optimization
* Partitioning strategy
* Cloud migration (Azure / Synapse)

---

## 👨‍💻 Author

**Kirolos Magdy**
SQL Developer | Data Engineer | BI Specialist

GitHub: [https://github.com/kirlosmagdy](https://github.com/kirlosmagdy)

---

> "Turning raw operational data into strategic business intelligence using modern data engineering practices."
