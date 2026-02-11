# 🏢 SQL Data Warehouse & Analytics Project

[![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/sql-server)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Data Engineering](https://img.shields.io/badge/Data-Engineering-blue?style=for-the-badge)](https://github.com/kirlosmagdy/SQL-DataWarehouse-Project)

> A comprehensive end-to-end data warehousing solution implementing modern Medallion Architecture with ETL pipelines, dimensional modeling, and advanced analytics using SQL Server.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Key Features](#-key-features)
- [Data Model](#-data-model)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Analytics & Insights](#-analytics--insights)
- [Technologies](#-technologies)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)
- [Connect With Me](#-connect-with-me)

---

## 🎯 Overview

This project demonstrates **enterprise-grade data warehousing** practices, showcasing the complete lifecycle from raw data ingestion to actionable business insights. Built on **SQL Server**, it implements the modern **Medallion Architecture** (Bronze-Silver-Gold layers) to transform disparate data sources into a unified analytical platform.

### 🎓 What You'll Learn

- Modern data warehouse architecture design
- ETL pipeline development and optimization
- Dimensional modeling (Star Schema)
- Data quality and cleansing techniques
- SQL-based analytics and reporting
- Best practices in data engineering

### 💼 Perfect For

- **Data Engineers** looking to showcase ETL expertise
- **Data Analysts** seeking to understand warehouse architecture
- **Students** building their data engineering portfolio
- **Professionals** transitioning into data roles

---

## 🏗️ Architecture

The project implements a **three-tier Medallion Architecture** for progressive data refinement:

![Data Architecture](docs/images/architecture.png)

### 📊 Architecture Layers

#### 🥉 **Bronze Layer** - Raw Data Ingestion
- **Purpose**: Store raw, unprocessed data as-is from source systems
- **Sources**: ERP and CRM CSV files
- **Process**: Batch processing with full load capabilities
- **Data Model**: None (as-is storage)
- **Technology**: SQL Server Tables with Stored Procedures

#### 🥈 **Silver Layer** - Data Cleansing & Transformation
- **Purpose**: Clean, standardize, and normalize data
- **Transformations**:
  - Data cleansing and validation
  - Standardization of formats
  - Data normalization
  - Derived column creation
  - Data enrichment
- **Data Model**: Normalized tables
- **Quality**: Enterprise-ready, consistent data

#### 🥇 **Gold Layer** - Business-Ready Analytics
- **Purpose**: Aggregated, business-ready data for reporting
- **Transformations**:
  - Data integration from multiple sources
  - Business logic application
  - Aggregations and calculations
- **Data Model**: **Star Schema** (Fact & Dimension tables)
- **Consumption**: BI tools, reports, and ad-hoc queries

### 🔄 Data Flow

![Data Flow Diagram](docs/images/dataflow.png)

**Sources** → **Bronze** (Raw) → **Silver** (Cleaned) → **Gold** (Modeled) → **Analytics**

---

## ✨ Key Features

### 🔧 Technical Implementation

- ✅ **Medallion Architecture** - Industry-standard three-layer approach
- ✅ **ETL Pipelines** - Automated data extraction, transformation, and loading
- ✅ **Star Schema Design** - Optimized for analytical queries
- ✅ **Data Quality Framework** - Comprehensive cleansing and validation
- ✅ **Stored Procedures** - Reusable, maintainable SQL logic
- ✅ **Version Control** - Git-based code management
- ✅ **Documentation** - Detailed data catalog and architecture diagrams

### 📈 Analytics Capabilities

- 📊 Customer behavior analysis
- 📦 Product performance tracking
- 💰 Sales trend analysis
- 🎯 KPI dashboards
- 🔍 Ad-hoc analytical queries

---

## 🗂️ Data Model

### Source Systems

![Source Systems](docs/images/sources.png)

The project integrates data from two primary sources:

- **CRM System**: Customer relationships, sales transactions, and product information
- **ERP System**: Product categories, customer demographics, and location data

### Star Schema Design

![Star Schema](docs/images/star_schema.png)

#### 📋 Fact Table

**`gold.fact_sales`**
- `order_number` (PK)
- `product_key` (FK)
- `customer_key` (FK)
- `order_date`
- `shipping_date`
- `due_date`
- `sales_amount` (Quantity × Price)
- `quantity`
- `price`

#### 📐 Dimension Tables

**`gold.dim_customers`**
- Customer demographics
- Marital status
- Gender
- Birthdate
- Country

**`gold.dim_products`**
- Product information
- Category hierarchy
- Maintenance requirements
- Cost and pricing
- Product line details

---

## 📂 Project Structure
