
# SQL Data Warehouse Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/sql-server)
[![T-SQL](https://img.shields.io/badge/T--SQL-100%25-blue)](https://github.com/kirlosmagdy/SQL-DataWarehouse-Project)

> A comprehensive data warehouse solution built with SQL Server, demonstrating modern data engineering practices including ETL processes, Medallion Architecture, and dimensional modeling for analytics.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Architecture](#project-architecture)
- [Features](#features)
- [Technologies](#technologies)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Data Pipeline](#data-pipeline)
- [Data Modeling](#data-modeling)
- [Analytics & Insights](#analytics--insights)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 🎯 Overview

This project demonstrates the end-to-end implementation of a modern data warehouse using SQL Server. It showcases industry-standard best practices in data engineering, from raw data ingestion through transformation to analytical modeling.

### Key Objectives

- **Consolidate** sales data from multiple source systems (ERP and CRM)
- **Transform** raw data through systematic cleansing and standardization
- **Model** data using dimensional modeling techniques (star schema)
- **Enable** analytical reporting and data-driven decision-making

## 🏗️ Project Architecture

This project implements the **Medallion Architecture**, a multi-layered data organization pattern:

```
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│   Bronze    │ ───> │   Silver    │ ───> │    Gold     │
│  Raw Data   │      │ Cleaned Data│      │ Analytics   │
└─────────────┘      └─────────────┘      └─────────────┘
```

### Architecture Layers

**🥉 Bronze Layer**
- Stores raw, unprocessed data exactly as received from source systems
- Data ingested from CSV files into SQL Server tables
- Preserves complete data lineage and historical records
- No transformations applied

**🥈 Silver Layer**
- Data cleansing and quality validation
- Standardization of formats and naming conventions
- Handling null values and data type conversions
- Business rule application and data normalization
- Deduplication and error correction

**🥇 Gold Layer**
- Business-ready analytical models
- Star schema implementation (fact and dimension tables)
- Optimized for query performance and reporting
- Aggregated metrics and KPIs
- Ready for BI tools and dashboards

## ✨ Features

- **Complete ETL Pipeline**: Full extract, transform, and load processes
- **Data Quality Framework**: Validation rules and data quality checks
- **Dimensional Modeling**: Star schema with fact and dimension tables
- **Incremental Loading**: Efficient data refresh mechanisms
- **Documentation**: Comprehensive data catalogs and naming conventions
- **Testing Suite**: Data quality and transformation validation scripts
- **Scalable Design**: Architecture ready for production deployment

## 🛠️ Technologies

- **Database**: Microsoft SQL Server
- **Language**: T-SQL (Transact-SQL)
- **Tools**: SQL Server Management Studio (SSMS)
- **Version Control**: Git & GitHub
- **Documentation**: Markdown, Draw.io

## 📁 Project Structure

```
SQL-DataWarehouse-Project/
│
├── Data Files/              # Source data files (CSV)
│   ├── ERP/                 # Enterprise Resource Planning data
│   └── CRM/                 # Customer Relationship Management data
│
├── scripts/                 # SQL scripts organized by layer
│   ├── bronze/              # Raw data ingestion scripts
│   ├── silver/              # Data cleansing and transformation
│   └── gold/                # Analytical model creation
│
├── docs/                    # Project documentation
│   ├── data_architecture.md # Architecture overview
│   ├── data_catalog.md      # Data dictionary
│   ├── naming_conventions.md# Naming standards
│   └── diagrams/            # Architecture and flow diagrams
│
├── test/                    # Testing and validation scripts
│   ├── data_quality/        # Quality check scripts
│   └── unit_tests/          # Transformation validation
│
├── LICENSE                  # MIT License
└── README.md               # This file
```

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **SQL Server** (Express Edition or higher)
- **SQL Server Management Studio (SSMS)** - [Download](https://aka.ms/ssmsfullsetup)
- **Git** - For cloning the repository

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/kirlosmagdy/SQL-DataWarehouse-Project.git
   cd SQL-DataWarehouse-Project
   ```

2. **Set up SQL Server Database**
   - Open SSMS and connect to your SQL Server instance
   - Create a new database for the project:
     ```sql
     CREATE DATABASE SalesDataWarehouse;
     GO
     ```

3. **Execute Bronze Layer Scripts**
   ```sql
   -- Navigate to scripts/bronze/ and execute in order:
   -- 1. Create bronze schema and tables
   -- 2. Load raw data from CSV files
   ```

4. **Execute Silver Layer Scripts**
   ```sql
   -- Navigate to scripts/silver/ and execute:
   -- Data cleansing and transformation scripts
   ```

5. **Execute Gold Layer Scripts**
   ```sql
   -- Navigate to scripts/gold/ and execute:
   -- Create dimensional model (fact and dimension tables)
   ```

### Data Loading

To load the source data into the Bronze layer:

```sql
-- Use BULK INSERT or SQL Server Import Wizard
BULK INSERT Bronze.ERP_Sales
FROM 'C:\path\to\Data Files\ERP\sales_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
```

## 🔄 Data Pipeline

### ETL Process Flow

1. **Extract**
   - Source systems: ERP and CRM (CSV files)
   - Load raw data into Bronze layer tables
   - Preserve original data structure and formats

2. **Transform**
   - **Data Cleansing**: Handle nulls, duplicates, and inconsistencies
   - **Standardization**: Apply consistent formats and naming
   - **Business Rules**: Implement validation and calculations
   - **Data Quality**: Run validation checks and error handling

3. **Load**
   - Populate dimension tables (SCD Type 2 where applicable)
   - Load fact tables with foreign key relationships
   - Create aggregated views and materialized results

### Data Flow Diagram

```
CSV Files → Bronze (Raw) → Silver (Cleaned) → Gold (Analytics) → Reports
```

## 📊 Data Modeling

### Star Schema Design

The Gold layer implements a **star schema** optimized for analytical queries:

#### Fact Tables
- **FactSales**: Sales transactions with measures (revenue, quantity, costs)
- **FactOrders**: Order-level metrics and KPIs

#### Dimension Tables
- **DimCustomer**: Customer attributes and demographics
- **DimProduct**: Product information and categories
- **DimDate**: Time dimension for temporal analysis
- **DimLocation**: Geographic hierarchy
- **DimSalesRep**: Sales representative information

### Key Design Principles

- **Grain**: Transaction-level granularity in fact tables
- **Surrogate Keys**: Auto-generated integer keys for dimensions
- **SCD Type 2**: Slowly Changing Dimensions for historical tracking
- **Denormalization**: Optimized for read performance
- **Indexing Strategy**: Clustered and non-clustered indexes for performance

## 📈 Analytics & Insights

The data warehouse enables analysis of:

- **Sales Performance**: Revenue trends, growth rates, and forecasting
- **Customer Behavior**: Purchase patterns, segmentation, and retention
- **Product Analytics**: Best sellers, category performance, profitability
- **Geographic Analysis**: Regional sales distribution and territory performance
- **Time-based Trends**: Seasonal patterns, YoY/MoM comparisons

### Sample Analytical Queries

```sql
-- Top 10 products by revenue
SELECT TOP 10 
    p.ProductName,
    SUM(f.SalesAmount) AS TotalRevenue
FROM Gold.FactSales f
JOIN Gold.DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

-- Monthly sales trend
SELECT 
    d.YearMonth,
    SUM(f.SalesAmount) AS Revenue,
    COUNT(DISTINCT f.CustomerKey) AS UniqueCustomers
FROM Gold.FactSales f
JOIN Gold.DimDate d ON f.DateKey = d.DateKey
GROUP BY d.YearMonth
ORDER BY d.YearMonth;
```

## 🤝 Contributing

Contributions are welcome! If you'd like to improve this project:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

**Kirlos Magdy**

- GitHub: [@kirlosmagdy](https://github.com/kirlosmagdy)
- Project Link: [SQL-DataWarehouse-Project](https://github.com/kirlosmagdy/SQL-DataWarehouse-Project)

---

⭐ If you found this project helpful, please consider giving it a star!

## 🙏 Acknowledgments

- Inspired by modern data warehouse best practices
- Built following the Medallion Architecture pattern
- Implements Ralph Kimball's dimensional modeling methodology

---

**Note**: This is a portfolio project demonstrating data engineering skills and best practices in building modern data warehouses. The data used is synthetic and for educational purposes.
