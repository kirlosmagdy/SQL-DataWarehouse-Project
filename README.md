# 🏢 Enterprise Data Warehouse Project

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat\&logo=microsoft-sql-server\&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-003B57?style=flat\&logo=database\&logoColor=white)](https://docs.microsoft.com/en-us/sql/t-sql/)
[![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion%20\(Bronze/Silver/Gold\)-FF6F00?style=flat)]()
[![ETL](https://img.shields.io/badge/ETL-Stored%20Procedures-00C853?style=flat)]()
[![Star Schema](https://img.shields.io/badge/Data%20Model-Star%20Schema-blueviolet?style=flat)]()

> **Production-grade Enterprise Data Warehouse built with SQL Server using Medallion Architecture (Bronze–Silver–Gold), automated ETL pipelines, dimensional modeling, and advanced business analytics.**

---

## 📌 Project Overview

This project demonstrates the end-to-end design and implementation of an **Enterprise Data Warehouse (EDW)** that integrates multiple operational systems (CRM & ERP) into a centralized analytical platform.

The solution follows modern **Data Engineering best practices**, including layered architecture, data quality enforcement, dimensional modeling (Star Schema), and business-focused reporting.

### 🎯 Business Objectives

* Consolidate customer, product, and sales data from multiple source systems
* Improve data quality, consistency, and reliability
* Enable analytical reporting and KPI tracking
* Support business decision-making with trusted, structured data

---

## 🏗️ Architecture Overview

### 🔷 Medallion Architecture (Bronze – Silver – Gold)

The warehouse follows the **Medallion Architecture pattern**, ensuring progressive refinement of data:

| Layer      | Purpose                       | Data State            | Key Characteristics                        |
| ---------- | ----------------------------- | --------------------- | ------------------------------------------ |
| **Bronze** | Raw ingestion layer           | As-is source data     | No transformations, full history preserved |
| **Silver** | Cleansed & standardized layer | Clean, validated data | Deduplication, normalization, enrichment   |
| **Gold**   | Business-ready layer          | Analytical model      | Star schema, aggregated views, KPIs        |

This layered approach ensures **data traceability, governance, and scalability**.

---

## 🔄 Data Integration

### 📥 Source Systems

The warehouse integrates data from two operational systems:

### CRM System

* `crm_cust_info` – Customer demographic data
* `crm_prd_info` – Product master data
* `crm_sales_details` – Sales transactions (order line level)

### ERP System

* `erp_cust_az12` – Additional customer attributes (birthdate, gender)
* `erp_loc_a101` – Customer geographic information
* `erp_px_cat_g1v2` – Product category hierarchy

### 🔗 Integration Strategy

* Customer data is merged across CRM & ERP systems
* Product dimension combines product master data with categorization hierarchy
* Sales fact table links customers and products via surrogate keys

---

## 🗄️ Database Layers

### 🥉 Bronze Layer – Raw Data

**Purpose:** Landing zone for source data without modification.

Tables:

* `bronze.crm_cust_info`
* `bronze.crm_prd_info`
* `bronze.crm_sales_details`
* `bronze.erp_cust_az12`
* `bronze.erp_loc_a101`
* `bronze.erp_px_cat_g1v2`

Key Characteristics:

* Full data replication from sources
* Preserves original structure
* Enables auditability and traceability

---

### 🥈 Silver Layer – Data Cleansing & Standardization

**Purpose:** Improve data quality and enforce consistency.

#### Key Transformations

* Trimming and formatting textual fields
* Standardizing gender and marital status values
* Removing invalid prefixes in IDs
* Deduplication using `ROW_NUMBER()`
* Validating and converting integer-based dates
* Handling NULL or invalid numeric values
* Deriving calculated columns (e.g., sales amount)
* Using window functions (`LEAD`) to calculate SCD end dates

This layer ensures **clean, reliable, and analytics-ready structured data**.

---

### 🥇 Gold Layer – Dimensional Model

**Purpose:** Deliver business-ready analytics using a Star Schema design.

#### ⭐ Dimensions

* `gold.dim_customers`
* `gold.dim_products` (Slowly Changing Dimension – Type 2)

#### 📊 Fact Table

* `gold.fact_sales`

#### 📈 Reporting Views

* `gold.report_customers`
* `gold.report_products`

The Gold layer supports:

* KPI measurement
* Revenue analysis
* Customer segmentation
* Product performance tracking

---

## ⚙️ ETL Pipeline

The ETL process is fully implemented using **T-SQL stored procedures**.

### Pipeline Characteristics

* Layer-by-layer data movement (Bronze → Silver → Gold)
* Logging and monitoring mechanisms
* Error handling using TRY/CATCH
* Transaction control for consistency
* Incremental loading strategy
* Performance-optimized transformations

This ensures a **robust, production-grade ETL framework**.

---

## 🧹 Data Quality Framework

The project includes structured data validation rules:

* ✔ Duplicate detection and removal
* ✔ Invalid date validation
* ✔ Null handling strategies
* ✔ Standardized categorical mappings
* ✔ Referential integrity enforcement

Data quality checks are embedded within transformation logic.

---

## 📊 Data Analysis & Business Insights

In addition to the warehouse implementation, extensive analytical SQL scripts were developed:

### 🔎 Exploratory Data Analysis (EDA)

* Sales trend analysis over time
* Revenue distribution by product category
* Customer demographic breakdown
* Country-level performance analysis

### 👥 Customer Analytics

* Customer lifetime value estimation
* Revenue per customer
* Segmentation by gender, geography, and marital status
* Top-performing customers identification

### 📦 Product Analytics

* Product revenue ranking
* Category-level sales contribution
* Product lifecycle performance
* Identification of high- and low-performing SKUs

These analyses demonstrate how the Gold layer enables **strategic business decision-making**.

---

## 🛠 Technologies Used

* Microsoft SQL Server 2019+
* T-SQL (Advanced Queries & Window Functions)
* Stored Procedures
* Medallion Architecture
* Star Schema Modeling
* Dimensional Modeling Concepts (SCD Type 2)

---

## 🚀 Getting Started

1. Clone the repository
2. Restore or create the SQL Server database
3. Execute schema creation scripts
4. Load Bronze layer data
5. Run ETL stored procedures
6. Query Gold layer views for analytics

---

## ✨ Key Highlights

* End-to-end Data Warehouse implementation
* Real-world enterprise architecture pattern
* Production-ready ETL framework
* Advanced SQL transformations & window functions
* Business-driven analytics design

---

## 👤 Author

**Kirolos Magdy**
Data Engineer | SQL Developer

---

⭐ If you found this project useful, consider giving it a star!
