# 🏢 Enterprise Data Warehouse Project

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat\&logo=microsoft-sql-server\&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-003B57?style=flat\&logo=database\&logoColor=white)](https://docs.microsoft.com/en-us/sql/t-sql/)
[![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion%20\(Bronze/Silver/Gold\)-FF6F00?style=flat)]()
[![ETL](https://img.shields.io/badge/ETL-Stored%20Procedures-00C853?style=flat)]()
[![Star Schema](https://img.shields.io/badge/Data%20Model-Star%20Schema-blueviolet?style=flat)]()

> **A production-grade Enterprise Data Warehouse built on SQL Server implementing the Medallion Architecture (Bronze–Silver–Gold), featuring automated ETL pipelines, data quality frameworks, dimensional modeling, and advanced business analytics.**

---

## 📋 Table of Contents

* [Project Overview](#-project-overview)
* [Architecture Overview](#-architecture-overview)
* [Data Architecture](#-data-architecture)
* [Data Flow & Integration](#-data-flow--integration)
* [Database Layers](#-database-layers)
* [Data Model](#-data-model)
* [ETL Pipeline](#-etl-pipeline)
* [Data Quality & Transformation](#-data-quality--transformation)
* [Exploratory Data Analysis](#-exploratory-data-analysis)
* [Business Intelligence & Reporting](#-business-intelligence--reporting)
* [Data Catalog](#-data-catalog)
* [Technologies Used](#-technologies-used)
* [Getting Started](#-getting-started)
* [Project Structure](#-project-structure)
* [Key Features](#-key-features)
* [Future Enhancements](#-future-enhancements)
* [Author](#-author)

---

## 🎯 Project Overview

This project presents a complete **Enterprise Data Warehouse solution** designed using Microsoft SQL Server and industry-standard data engineering best practices.

It implements the **Medallion Architecture (Bronze–Silver–Gold)** to progressively refine raw operational data from multiple source systems (CRM & ERP) into high-quality, analytics-ready datasets.

### 🔑 Key Capabilities

* ✅ **Multi-Source Data Integration** – Consolidates data from CRM (Customer Relationship Management) and ERP (Enterprise Resource Planning) systems.
* ✅ **Automated ETL Pipelines** – Stored procedures with structured logging, error handling, validation rules, and performance considerations.
* ✅ **Data Quality Framework** – Cleansing, deduplication, standardization, validation, and enrichment across layers.
* ✅ **Dimensional Modeling** – Star Schema optimized for analytical and reporting workloads.
* ✅ **Advanced Analytics** – Customer segmentation, product performance analysis, revenue trends, and behavioral insights.
* ✅ **Business-Ready Reports** – Analytical views designed for BI tools and stakeholder reporting.

---

## 🏗️ Architecture Overview

### Medallion Architecture Pattern

The warehouse follows the **Medallion Architecture**, a modern layered data engineering approach that structures data into progressively refined tiers:

* **Bronze Layer** → Raw, unmodified source data
* **Silver Layer** → Cleaned, standardized, validated data
* **Gold Layer** → Business-ready dimensional models and reporting views

This architecture ensures:

* Clear separation of concerns
* Improved data reliability
* Traceability across transformation stages
* Scalable analytical performance

---

## 🏛️ Data Architecture

### System Architecture Diagram

![Data Architecture](docs/data_architecture.png)

### Architecture Components

| Layer      | Purpose                          | Object Type | Transformations                                     | Data Model         |
| ---------- | -------------------------------- | ----------- | --------------------------------------------------- | ------------------ |
| **Bronze** | Landing zone for raw source data | Tables      | None (as-is ingestion)                              | None               |
| **Silver** | Cleaned and standardized data    | Tables      | Cleansing, normalization, enrichment, deduplication | Normalized staging |
| **Gold**   | Analytics-ready business layer   | Views       | Business logic, aggregations, dimensional joins     | Star Schema        |

---

## 🔄 Data Flow & Integration

### Source Systems

The warehouse integrates data from two operational domains:

### CRM (Customer Relationship Management)

| Source Table      | Description                                    |
| ----------------- | ---------------------------------------------- |
| crm_cust_info     | Customer demographic profiles                  |
| crm_prd_info      | Product master data and historical costs       |
| crm_sales_details | Transactional sales records (order line level) |

### ERP (Enterprise Resource Planning)

| Source Table    | Description                                        |
| --------------- | -------------------------------------------------- |
| erp_cust_az12   | Additional customer attributes (birthdate, gender) |
| erp_loc_a101    | Customer geographic and country mapping            |
| erp_px_cat_g1v2 | Product category hierarchy and maintenance flags   |

### Integration Logic

* **Customer Dimension** → Merged from:

  * crm_cust_info
  * erp_cust_az12
  * erp_loc_a101

* **Product Dimension** → Merged from:

  * crm_prd_info
  * erp_px_cat_g1v2

* **Sales Fact Table** → Linked via surrogate keys:

  * customer_key
  * product_key

---

## 🗄️ Database Layers

### 1️⃣ Bronze Layer (Raw Data)

**Purpose:** Landing zone for raw, unmodified source data.

```sql
-- CRM Tables
bronze.crm_cust_info
bronze.crm_prd_info
bronze.crm_sales_details

-- ERP Tables
bronze.erp_cust_az12
bronze.erp_loc_a101
bronze.erp_px_cat_g1v2
```

---

### 2️⃣ Silver Layer (Cleansed & Standardized Data)

**Purpose:** Ensures data consistency, reliability, and analytical readiness.

| Table                    | Transformations                                                                                             |
| ------------------------ | ----------------------------------------------------------------------------------------------------------- |
| silver.crm_cust_info     | Trimming whitespace, marital status standardization, gender normalization, deduplication using ROW_NUMBER() |
| silver.crm_prd_info      | Category extraction, product line standardization, NULL cost handling, SCD handling using LEAD()            |
| silver.crm_sales_details | Date conversion, format validation, recalculating sales amount, NULL handling                               |
| silver.erp_cust_az12     | Removing prefixes, validating birthdates, gender normalization                                              |
| silver.erp_loc_a101      | Cleaning customer IDs, standardizing country codes                                                          |
| silver.erp_px_cat_g1v2   | Data type validation                                                                                        |

---

### 3️⃣ Gold Layer (Business Layer – Star Schema)

**Purpose:** Provides analytics-ready datasets.

#### Dimension Views

* gold.dim_customers (Conformed Customer Dimension)
* gold.dim_products (Slowly Changing Dimension – Type 2)

#### Fact View

* gold.fact_sales (Transactional Fact Table)

#### Reporting Views

* gold.report_customers
* gold.report_products

---

## 📊 Exploratory Data Analysis

In addition to building the warehouse, extensive SQL-based exploratory data analysis (EDA) was performed to extract actionable insights.

### Customer Analysis

* Customer segmentation by country and demographic attributes
* Revenue contribution per customer
* Purchase frequency analysis
* Identification of high-value customers
* Age distribution and gender-based revenue trends

### Product Analysis

* Revenue and profit contribution by category
* Product line performance comparison
* Top-selling products by revenue and quantity
* Trend analysis across time periods

### Sales Analysis

* Monthly and yearly revenue trends
* Sales growth patterns
* Average order value calculation
* Revenue distribution across regions

All analytical queries are implemented using advanced SQL techniques including:

* Window functions
* Aggregations with GROUP BY and HAVING
* CTEs (Common Table Expressions)
* Ranking functions (RANK, DENSE_RANK)
* Date-based trend analysis

---

## 📈 Business Intelligence & Reporting

The Gold Layer exposes reporting views designed for direct integration with BI tools such as:

* Power BI
* Tableau
* Excel

These views support:

* Executive dashboards
* Customer performance reporting
* Product profitability analysis
* Sales trend monitoring

---

## 🗂️ Data Model

The Gold layer follows a **Star Schema**:

* Fact Table: fact_sales
* Dimensions:

  * dim_customers
  * dim_products
  * date dimension (derived from transaction date)

This model ensures:

* Optimized query performance
* Simplified reporting logic
* Clear business interpretation

---

## ⚙️ ETL Pipeline

The ETL process is implemented using SQL Server stored procedures:

* Layered loading (Bronze → Silver → Gold)
* Error handling using TRY...CATCH
* Logging execution metadata
* Incremental load considerations
* Data validation checks before promotion to next layer

---

## 🧹 Data Quality & Transformation Framework

The project implements structured quality rules including:

* Deduplication logic
* Standardized code mappings
* Validation of date formats
* NULL handling policies
* Referential integrity validation
* Slowly Changing Dimension handling (Type 2)

---

## 🛠️ Technologies Used

* Microsoft SQL Server 2019+
* T-SQL (Advanced)
* Stored Procedures
* Window Functions
* Star Schema Modeling
* Medallion Architecture

---

## 🚀 Getting Started

1. Clone the repository
2. Create the required schemas: bronze, silver, gold
3. Execute table creation scripts
4. Load raw data into Bronze layer
5. Run ETL stored procedures in sequence
6. Query Gold layer views for analytics

---

## 🌟 Key Features

* Enterprise-ready layered architecture
* End-to-end ETL implementation
* Production-style data quality rules
* Dimensional modeling best practices
* Analytical reporting layer
* SQL-based advanced analytics

---

## 👤 Author

**Koka Magdy**

Data Engineer | SQL Developer | Business Intelligence Enthusiast

---

> This project demonstrates end-to-end data engineering capabilities — from raw data ingestion to executive-level analytics — using enterprise architectural standards.
