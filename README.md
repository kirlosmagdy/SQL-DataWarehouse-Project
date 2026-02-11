# SQL-DataWarehouse-Project

![MIT License](https://img.shields.io/badge/license-MIT-green.svg)

A production-style **SQL Server data warehouse and analytics pipeline** demonstrating end-to-end ETL, dimensional modeling, and BI-ready reporting using the Medallion (Bronze/Silver/Gold) architecture.

---

## 🚀 Architecture Overview (Medallion)

* **Bronze (Raw Ingestion)**
  Source data landed as-is for traceability and replay.

* **Silver (Clean & Conformed)**
  Data is standardized, deduplicated, typed, and enriched.

* **Gold (Analytics-Ready)**
  Star-schema models optimized for BI and business queries.

High-level flow:

`Sources → Bronze → Silver → Gold → BI / Analytics`

---

## 📥 Data Sources & ETL Approach

**Sources**

* CSV / flat files (transactional & reference data)
* Sample operational datasets (customers, products, sales)

**ETL Strategy**

* Incremental loads where applicable
* Staging tables for validation
* Transformations implemented in SQL
* Surrogate keys for dimensions
* Audit columns: `CreatedAt`, `UpdatedAt`, `BatchId`

Core steps:

1. Land raw files into Bronze tables
2. Clean and standardize in Silver
3. Build dimensional models in Gold

---

## 🧱 Data Modeling

The Gold layer follows a **Star Schema**:

**Fact Tables**

* `FactSales` – measures: SalesAmount, Quantity

**Dimension Tables**

* `DimCustomer`
* `DimProduct`
* `DimDate`

Design goals:

* Simple joins for BI tools
* Clear business definitions
* Support for historical analysis

---

## 🎯 Analytics Goals

This project enables:

* Sales performance analysis
* Customer segmentation
* Product trends
* Time-series reporting

Example KPIs:

* Total Sales
* Revenue by Product / Customer
* Monthly Growth
* Top-N Products

---

## 🛠 Tech Stack

* **Database:** Microsoft SQL Server
* **ETL:** T-SQL (stored procedures & scripts)
* **Modeling:** Star Schema (Dimensional Modeling)
* **BI / Visualization:** Power BI (or any SQL-compatible BI tool)
* **Version Control:** Git & GitHub

---

## 📁 Repository Structure

```
SQL-DataWarehouse-Project/
│
├── data/                # Sample source files (CSV)
├── sql/
│   ├── bronze/          # Raw ingestion scripts
│   ├── silver/          # Cleaning & transformation logic
│   └── gold/            # Star schema & analytics models
│
├── etl/                 # Stored procedures / orchestration scripts
├── reports/             # Sample queries & BI exports
└── README.md
```

---

## ⚙️ Local Setup

### Requirements

* Microsoft SQL Server (2019+ recommended)
* SQL Server Management Studio (SSMS)
* Power BI Desktop (optional, for visualization)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/kirlosmagdy/SQL-DataWarehouse-Project.git
cd SQL-DataWarehouse-Project
```

2. Create a new database in SQL Server (e.g., `DW_Project`).

3. Execute scripts in this order:

* `sql/bronze/*`
* `sql/silver/*`
* `sql/gold/*`

4. Load CSV files from `/data` into Bronze tables.

5. Run ETL stored procedures inside `/etl`.

---

## ▶️ Usage Examples

### Sample Query – Total Sales by Product

```sql
SELECT p.ProductName,
       SUM(f.SalesAmount) AS TotalSales
FROM FactSales f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
```

### Dashboards

Connect Power BI to the Gold layer and build:

* Sales Overview
* Customer Insights
* Product Performance

---

## ✅ Validation, Testing & Data Quality

* Row-count checks between layers
* Primary/foreign key validation
* NULL and duplicate detection
* Basic reconciliation reports

Recommended enhancements:

* Add automated test scripts
* Introduce data quality metrics
* Implement logging tables

---

## 🤝 Collaboration Guidelines

Contributions are welcome.

* Use clear, descriptive commit messages
* Follow existing SQL formatting
* Keep transformations idempotent
* Add comments for complex logic

To contribute:

1. Fork the repo
2. Create a feature branch
3. Submit a pull request

---

## 📄 License

This project is licensed under the MIT License.

---

## 👤 Author

**kirlosmagdy**
GitHub: [https://github.com/kirlosmagdy](https://github.com/kirlosmagdy)

---

## 📌 Project Status

✅ Core warehouse implemented
✅ Star schema complete
🚧 BI dashboards and automated testing in progress

---

## 🖼 Architecture & Data Model Diagrams

### Medallion Data Flow

![](data_flow.png)

### Source System Integration (CRM / ERP)

![](data_integration.png)

### Star Schema – Gold Layer

![](data_model.png)

### End-to-End Warehouse Architecture

![](data_architecture.png)

---

If you find this project useful, feel free to ⭐ the repository.
