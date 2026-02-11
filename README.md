SQL Data Warehouse Project

A comprehensive end-to-end SQL Data Warehouse implementation focusing on ETL processes, dimensional modeling, and data integrity for enterprise-level analytics.

📖 Overview

This project demonstrates the architecture and implementation of a modern Data Warehouse using SQL. It covers the full lifecycle of data movement, starting from a Bronze (Landing/Staging) layer to a Gold (Analytics) layer. The repository showcases advanced SQL techniques, including stored procedures for ETL automation, view creation for reporting, and rigorous data quality checks.

Motivation

In modern data engineering, the ability to transform raw, siloed data into actionable insights is critical. This project serves as a blueprint for building scalable, maintainable data infrastructures that support Business Intelligence (BI) tools and data-driven decision-making.

✨ Features

Multi-layered Architecture: Clear separation between Staging, Integration, and Presentation layers.

Dimensional Modeling: Implementation of Star Schema with optimized Fact and Dimension tables.

ETL Automation: Scripted stored procedures to handle incremental loads and data transformations.

Data Quality Framework: Built-in scripts to detect nulls, duplicates, and referential integrity issues.

Naming Conventions: Strict adherence to professional SQL naming standards for objects and variables.

🛠 Tech Stack

Database Engine: Microsoft SQL Server (T-SQL)

Data Modeling: Star Schema (Fact & Dimension)

Tooling: SQL Server Management Studio (SSMS) / Azure Data Studio

🚀 Getting Started

Prerequisites

SQL Server 2019+ (Developer or Express edition)

SQL Server Management Studio (SSMS) or Azure Data Studio

Basic knowledge of T-SQL and Data Warehousing concepts.

Installation

Clone the repository:

git clone [https://github.com/kirlosmagdy/SQL-DataWarehouse-Project.git](https://github.com/kirlosmagdy/SQL-DataWarehouse-Project.git)
cd SQL-DataWarehouse-Project


Initialize the Database:

Execute the Create_Database.sql (TBD: Verify filename in repo) script to set up the environment.

Deploy Schemas:

Run the scripts in the following order:

/scripts/01_init_schema.sql (TBD: Path check)

/scripts/02_create_dimensions.sql

/scripts/03_create_facts.sql

🏗 Architecture & Code Structure

├── scripts/
│   ├── 01_Bronze_Layer/      # Raw data ingestion scripts
│   ├── 02_Silver_Layer/      # Data cleaning and standardization
│   └── 03_Gold_Layer/        # Final Dimensional Model (Facts/Dims)
├── documentation/
│   └── Data_Dictionary.md    # TBD: Detailed column definitions
├── tests/
│   └── Quality_Checks.sql    # Data validation queries
└── LICENSE                   # MIT License


Key Components

Bronze Layer: Minimal transformation, focused on high-speed ingestion from source systems.

Silver Layer: Handles data deduplication, casting, and business logic application.

Gold Layer: The "Source of Truth" for BI tools, containing highly optimized Fact tables joined with descriptive Dimension tables.

🔍 Usage & Workflows

Triggering the ETL Process

To refresh the Data Warehouse, execute the master control procedure:

EXEC [dbo].[usp_Load_Full_Warehouse];


Querying the Gold Layer

Example of a typical analytical query:

SELECT 
    d.ProductCategory, 
    SUM(f.SalesAmount) AS TotalSales
FROM Gold.FactSales f
JOIN Gold.DimProduct d ON f.ProductKey = d.ProductKey
GROUP BY d.ProductCategory;


🧪 Testing & Validation

Data integrity is verified through a suite of validation scripts located in /tests/:

Schema Validation: Ensures data types match source definitions.

Row Count Reconciliation: Compares source counts vs. destination counts.

Null Checks: Identifies critical missing values in primary and foreign keys.

To run tests:

# Execute within SSMS
EXEC [tests].[usp_RunAllDataTests];


🚧 Known Limitations

TBD: Currently supports full loads; incremental loading via Change Data Capture (CDC) is in the roadmap.

TBD: Hard-coded file paths in some ingestion scripts might require manual updates for local environments.

🤝 Contributing

Contributions are welcome! Please follow these steps:

Fork the Project.

Create your Feature Branch (git checkout -b feature/AmazingFeature).

Commit your Changes (git commit -m 'Add some AmazingFeature').

Push to the Branch (git push origin feature/AmazingFeature).

Open a Pull Request.

📄 License & Credits

Distributed under the MIT License. See LICENSE for more information.
Author: Kirlos Magdy

📞 Contact & Support

Maintainer: Kirlos Magdy

Project Link: https://github.com/kirlosmagdy/SQL-DataWarehouse-Project

LinkedIn: [TBD: Add Profile Link]
