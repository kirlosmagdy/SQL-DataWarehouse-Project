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




👤 Author

Kirolos Magdy
Data Engineer | SQL Developer

📧 Email: kirolosmagdy242@gmail.com
🔗 LinkedIn: https://www.linkedin.com/in/kirolos-magdy1/




# 🏢 Enterprise Data Warehouse Project [![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/en-us/sql-server) [![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-003B57?style=flat&logo=database&logoColor=white)](https://docs.microsoft.com/en-us/sql/t-sql/) [![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion%20(Bronze/Silver/Gold)-FF6F00?style=flat)]() [![ETL](https://img.shields.io/badge/ETL-Stored%20Procedures-00C853?style=flat)]() [![Star Schema](https://img.shields.io/badge/Data%20Model-Star%20Schema-blueviolet?style=flat)]() &gt; **A production-grade data warehouse implementing the Medallion Architecture (Bronze-Silver-Gold) with automated ETL pipelines, data quality frameworks, and comprehensive business intelligence reporting.** --- ## 📋 Table of Contents - [Project Overview](#-project-overview) - [Architecture Overview](#-architecture-overview) - [Data Architecture](#-data-architecture) - [Data Flow & Integration](#-data-flow--integration) - [Database Layers](#-database-layers) - [Data Model](#-data-model) - [ETL Pipeline](#-etl-pipeline) - [Data Quality & Transformation](#-data-quality--transformation) - [Business Intelligence & Reporting](#-business-intelligence--reporting) - [Data Catalog](#-data-catalog) - [Technologies Used](#-technologies-used) - [Getting Started](#-getting-started) - [Project Structure](#-project-structure) - [Key Features](#-key-features) - [Future Enhancements](#-future-enhancements) - [Author](#-author) --- ## 🎯 Project Overview This project demonstrates a complete **enterprise data warehouse solution** built on SQL Server using industry best practices. It implements a **Medallion Architecture** (Bronze-Silver-Gold) to progressively transform raw operational data from multiple source systems (CRM & ERP) into actionable business intelligence. **Key Capabilities:** - ✅ **Multi-Source Data Integration**: Consolidates data from CRM (Customer Relationship Management) and ERP (Enterprise Resource Planning) systems - ✅ **Automated ETL Pipelines**: Stored procedures with comprehensive logging, error handling, and performance monitoring - ✅ **Data Quality Framework**: Cleansing, standardization, deduplication, and validation at each layer - ✅ **Dimensional Modeling**: Star Schema optimized for analytical workloads - ✅ **Advanced Analytics**: Customer segmentation, product performance analysis, and trend identification - ✅ **Business-Ready Reports**: Pre-built views for Customer and Product analytics --- ## 🏗️ Architecture Overview ### Medallion Architecture Pattern The warehouse follows the **Medallion Architecture**, a modern data engineering pattern that organizes data into three distinct layers, each with increasing levels of quality and business readiness: --- ## 🏛️ Data Architecture ### System Architecture Diagram ![Data Architecture](docs/data_architecture.png) **Architecture Components:** | Layer | Purpose | Object Type | Transformations | Data Model | |-------|---------|-------------|-----------------|------------| | **Bronze** | Landing zone for raw data | Tables | None (as-is) | None | | **Silver** | Cleansed and standardized data | Tables | Data cleansing, standardization, normalization, derived columns, data enrichment | None | | **Gold** | Business-ready analytics | Views | Data integration, aggregations, business logic | Star Schema | --- ## 🔄 Data Flow & Integration ### Source System Integration The warehouse integrates data from two operational systems: ![Data Integration](docs/data_integration.png) #### CRM (Customer Relationship Management) System | Source Table | Description | Records | |--------------|-------------|---------| | crm_cust_info | Customer demographic information | Customer profiles | | crm_prd_info | Product definitions and historical costs | Product master data | | crm_sales_details | Transactional sales records at order line level | Sales transactions | #### ERP (Enterprise Resource Planning) System | Source Table | Description | Records | |--------------|-------------|---------| | erp_cust_az12 | Additional customer PII (birthdate, gender) | Customer attributes | | erp_loc_a101 | Customer geographic location and country mapping | Location data | | erp_px_cat_g1v2 | Product categorization hierarchy and maintenance flags | Product classification | ### Data Flow Diagram ![Data Flow](docs/data_flow.png) **Integration Logic:** - **Customer Data**: Merged from crm_cust_info + erp_cust_az12 + erp_loc_a101 - **Product Data**: Merged from crm_prd_info + erp_px_cat_g1v2 - **Sales Data**: Linked to dimensions via product_key and customer_key --- ## 🗄️ Database Layers ### 1. Bronze Layer (Raw Data) **Purpose**: Landing zone for raw, unmodified data from source systems. **Tables Created:**
sql
-- CRM Tables
bronze.crm_cust_info      -- Customer demographics
bronze.crm_prd_info       -- Product information
bronze.crm_sales_details  -- Sales transactions

-- ERP Tables
bronze.erp_cust_az12      -- Customer birthdate/gender
bronze.erp_loc_a101       -- Customer location/country
bronze.erp_px_cat_g1v2    -- Product categories


2. Silver Layer (Cleansed Data)
Purpose: Standardized, deduplicated, and validated data.


| Table                      | Transformations                                                                                                                                                                                          |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `silver.crm_cust_info`     | • Trimming whitespace from names<br>• Standardizing marital status (S→Single, M→Married)<br>• Standardizing gender (F→Female, M→Male)<br>• Deduplication using ROW\_NUMBER()                             |
| `silver.crm_prd_info`      | • Parsing product key into category\_id<br>• Standardizing product line codes (M→Mountain, R→Road, etc.)<br>• Handling NULL costs (default to 0)<br>• Calculating end dates using LEAD() window function |
| `silver.crm_sales_details` | • Converting integer dates to DATE format<br>• Validating date formats (YYYYMMDD)<br>• Recalculating sales amounts (quantity × price)<br>• Handling NULL/invalid prices                                  |
| `silver.erp_cust_az12`     | • Removing 'NAS' prefix from customer IDs<br>• Validating birthdates (future dates → NULL)<br>• Standardizing gender values                                                                              |
| `silver.erp_loc_a101`      | • Removing dashes from customer IDs<br>• Standardizing country codes (DE→Germany, US/USA→United States)                                                                                                  |
| `silver.erp_px_cat_g1v2`   | • Direct pass-through with data type validation                                                                                                                                                          |



3. Gold Layer (Business Views)
Purpose: Dimensional model for analytics and reporting.
Views Created:
gold.dim_customers - Conformed customer dimension
gold.dim_products - Slowly Changing Product dimension (Type 2)
gold.fact_sales - Transactional fact table
gold.report_customers - Customer analytics report
gold.report_products - Product analytics report




this is my project readme file I want to write it in professional way and fix the issues and add a part for the analysis I made I upload the files of analysis I made 


