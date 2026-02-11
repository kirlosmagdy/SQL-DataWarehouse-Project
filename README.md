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
```
SQL-DataWarehouse-Project/
│
├── 📁 datasets/                    # Source data files
│   ├── crm_sales_details.csv
│   ├── crm_cust_info.csv
│   ├── crm_prd_info.csv
│   ├── erp_cust_az12.csv
│   ├── erp_loc_a101.csv
│   └── erp_px_cat_g1v2.csv
│
├── 📁 docs/                        # Documentation & diagrams
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── etl.drawio
│   ├── data_catalog.md
│   ├── naming-conventions.md
│   └── requirements.md
│
├── 📁 scripts/                     # SQL scripts organized by layer
│   ├── 📁 bronze/                  # Raw data ingestion scripts
│   │   ├── create_tables.sql
│   │   └── load_data.sql
│   │
│   ├── 📁 silver/                  # Data cleansing & transformation
│   │   ├── clean_customers.sql
│   │   ├── clean_products.sql
│   │   └── clean_sales.sql
│   │
│   └── 📁 gold/                    # Star schema & analytics
│       ├── dim_customers.sql
│       ├── dim_products.sql
│       ├── fact_sales.sql
│       └── analytics_queries.sql
│
├── 📁 tests/                       # Data quality tests
│   └── quality_checks.sql
│
├── 📄 README.md
├── 📄 LICENSE
├── 📄 .gitignore
└── 📄 requirements.txt
```

---

## 🚀 Getting Started

### Prerequisites

- **SQL Server Express** (Free) - [Download](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- **SQL Server Management Studio (SSMS)** - [Download](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- **Git** - [Download](https://git-scm.com/downloads)

### Installation

1. **Clone the Repository**
```bash
   git clone https://github.com/kirlosmagdy/SQL-DataWarehouse-Project.git
   cd SQL-DataWarehouse-Project
```

2. **Setup SQL Server Database**
```sql
   -- Create database
   CREATE DATABASE SalesDataWarehouse;
   GO
```

3. **Execute Scripts in Order**
   - Run Bronze layer scripts first
   - Then Silver layer scripts
   - Finally Gold layer scripts

4. **Load Sample Data**
   - Import CSV files from `datasets/` folder
   - Execute data loading stored procedures

### Quick Start Guide

Detailed setup instructions available in [Installation Guide](docs/installation.md)

---

## 📊 Analytics & Insights

### Sample Business Questions Answered

1. **Customer Analysis**
   - Who are our top customers by revenue?
   - What is the customer lifetime value distribution?
   - Which demographic segments generate the most sales?

2. **Product Performance**
   - What are the best-selling products?
   - Which product categories drive revenue?
   - How do maintenance costs impact profitability?

3. **Sales Trends**
   - What are monthly/quarterly sales trends?
   - Which time periods show peak performance?
   - What is the average order value over time?

### Example Analytics Query
```sql
-- Top 10 Products by Revenue
SELECT TOP 10
    p.product_name,
    p.category,
    SUM(f.sales_amount) AS total_revenue,
    SUM(f.quantity) AS units_sold,
    AVG(f.price) AS avg_price
FROM gold.fact_sales f
JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC;
```

---

## 🛠️ Technologies

| Technology | Purpose |
|------------|---------|
| **SQL Server Express** | Database engine |
| **T-SQL** | Query language & stored procedures |
| **SSMS** | Database management |
| **Draw.io** | Architecture diagrams |
| **Git/GitHub** | Version control |

---

## 📚 Documentation

- [**Data Catalog**](docs/data_catalog.md) - Complete data dictionary
- [**Naming Conventions**](docs/naming-conventions.md) - Coding standards
- [**Requirements**](docs/requirements.md) - Business & technical requirements
- [**ETL Documentation**](docs/etl.drawio) - ETL process diagrams

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to use, modify, and distribute this project with proper attribution.

---

## 🌟 About the Author

**Kirlos Magdy** | Data Engineering Enthusiast

Passionate about transforming raw data into actionable insights and building scalable data solutions.

---

## 📫 Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](YOUR_LINKEDIN_URL)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/kirlosmagdy)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:YOUR_EMAIL)

---

## 🎓 Learning Resources

### Free Courses

All courses and materials are completely **FREE**! Your support through subscribing, liking, and commenting is greatly appreciated.

- ✅ **SQL Full Course** - [Watch Now](COURSE_LINK) | [Materials](MATERIALS_LINK)
- ✅ **Tableau Full Course** - [Watch Now](COURSE_LINK) | [Materials](MATERIALS_LINK)
- ✅ **SQL Data Warehouse Project** - [Watch Now](COURSE_LINK) | [Repo](REPO_LINK)
- ✅ **SQL Exploratory Data Analysis** - [Watch Now](COURSE_LINK) | [Materials](MATERIALS_LINK)
- ✅ **Advanced SQL Analytics** - [Watch Now](COURSE_LINK) | [Materials](MATERIALS_LINK)

---

## ⭐ Show Your Support

If you found this project helpful, please consider:

- ⭐ Starring the repository
- 🐛 Reporting bugs or issues
- 💡 Suggesting new features
- 📢 Sharing with others

---

<div align="center">

**Made with ❤️ for the Data Community**

[⬆ Back to Top](#-sql-data-warehouse--analytics-project)

</div>
