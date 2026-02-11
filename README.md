# 🏢 Enterprise Data Warehouse Project

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-Advanced-003B57?style=flat&logo=database&logoColor=white)](https://docs.microsoft.com/en-us/sql/t-sql/)
[![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion%20(Bronze/Silver/Gold)-FF6F00?style=flat)]()
[![ETL](https://img.shields.io/badge/ETL-Stored%20Procedures-00C853?style=flat)]()
[![Star Schema](https://img.shields.io/badge/Data%20Model-Star%20Schema-blueviolet?style=flat)]()

&gt; **A production-grade data warehouse implementing the Medallion Architecture (Bronze-Silver-Gold) with automated ETL pipelines, data quality frameworks, and comprehensive business intelligence reporting.**

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Architecture Overview](#-architecture-overview)
- [Data Architecture](#-data-architecture)
- [Data Flow & Integration](#-data-flow--integration)
- [Database Layers](#-database-layers)
- [Data Model](#-data-model)
- [ETL Pipeline](#-etl-pipeline)
- [Data Quality & Transformation](#-data-quality--transformation)
- [Business Intelligence & Reporting](#-business-intelligence--reporting)
- [Data Catalog](#-data-catalog)
- [Technologies Used](#-technologies-used)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Key Features](#-key-features)
- [Future Enhancements](#-future-enhancements)
- [Author](#-author)

---

## 🎯 Project Overview

This project demonstrates a complete **enterprise data warehouse solution** built on SQL Server using industry best practices. It implements a **Medallion Architecture** (Bronze-Silver-Gold) to progressively transform raw operational data from multiple source systems (CRM & ERP) into actionable business intelligence.

**Key Capabilities:**
- ✅ **Multi-Source Data Integration**: Consolidates data from CRM (Customer Relationship Management) and ERP (Enterprise Resource Planning) systems
- ✅ **Automated ETL Pipelines**: Stored procedures with comprehensive logging, error handling, and performance monitoring
- ✅ **Data Quality Framework**: Cleansing, standardization, deduplication, and validation at each layer
- ✅ **Dimensional Modeling**: Star Schema optimized for analytical workloads
- ✅ **Advanced Analytics**: Customer segmentation, product performance analysis, and trend identification
- ✅ **Business-Ready Reports**: Pre-built views for Customer and Product analytics

---

## 🏗️ Architecture Overview

### Medallion Architecture Pattern

The warehouse follows the **Medallion Architecture**, a modern data engineering pattern that organizes data into three distinct layers, each with increasing levels of quality and business readiness:

---

## 🏛️ Data Architecture

### System Architecture Diagram

![Data Architecture](docs/data_architecture.png)

**Architecture Components:**

| Layer | Purpose | Object Type | Transformations | Data Model |
|-------|---------|-------------|-----------------|------------|
| **Bronze** | Landing zone for raw data | Tables | None (as-is) | None |
| **Silver** | Cleansed and standardized data | Tables | Data cleansing, standardization, normalization, derived columns, data enrichment | None |
| **Gold** | Business-ready analytics | Views | Data integration, aggregations, business logic | Star Schema |

---

## 🔄 Data Flow & Integration

### Source System Integration

The warehouse integrates data from two operational systems:

![Data Integration](docs/data_integration.png)

#### CRM (Customer Relationship Management) System
| Source Table | Description | Records |
|--------------|-------------|---------|
| `crm_cust_info` | Customer demographic information | Customer profiles |
| `crm_prd_info` | Product definitions and historical costs | Product master data |
| `crm_sales_details` | Transactional sales records at order line level | Sales transactions |

#### ERP (Enterprise Resource Planning) System
| Source Table | Description | Records |
|--------------|-------------|---------|
| `erp_cust_az12` | Additional customer PII (birthdate, gender) | Customer attributes |
| `erp_loc_a101` | Customer geographic location and country mapping | Location data |
| `erp_px_cat_g1v2` | Product categorization hierarchy and maintenance flags | Product classification |

### Data Flow Diagram

![Data Flow](docs/data_flow.png)

**Integration Logic:**
- **Customer Data**: Merged from `crm_cust_info` + `erp_cust_az12` + `erp_loc_a101`
- **Product Data**: Merged from `crm_prd_info` + `erp_px_cat_g1v2`
- **Sales Data**: Linked to dimensions via `product_key` and `customer_key`

---

## 🗄️ Database Layers

### 1. Bronze Layer (Raw Data)

**Purpose**: Landing zone for raw, unmodified data from source systems.

**Tables Created:**
```sql
-- CRM Tables
bronze.crm_cust_info      -- Customer demographics
bronze.crm_prd_info       -- Product information
bronze.crm_sales_details  -- Sales transactions

-- ERP Tables
bronze.erp_cust_az12      -- Customer birthdate/gender
bronze.erp_loc_a101       -- Customer location/country
bronze.erp_px_cat_g1v2    -- Product categories
