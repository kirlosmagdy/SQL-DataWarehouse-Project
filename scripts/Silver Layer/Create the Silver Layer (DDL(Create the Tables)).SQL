/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Description:
    This script defines the schema for the 'Silver' layer. 
    The Silver layer represents the "Cleansed" zone, where data from the 
    Bronze layer is standardized, validated, and deduplicated to ensure 
    a single version of truth before reaching the Gold layer.

Usage:
    - Run this script to initialize the Silver layer structure.
    - Data in these tables should be populated via ETL/ELT processes 
      that apply cleaning logic (e.g., handling NULLs, date formatting).
===============================================================================
*/

-- =============================================================================
-- SOURCE SYSTEM: CRM (Customer Relationship Management)
-- =============================================================================

-- Standardized customer profile data with cleansed attributes
CREATE TABLE silver.crm_cust_info(
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(50),
    cst_lastname       NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr           NVARCHAR(50),
    cst_create_date    DATE,
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

-- Refined product master data including historical cost tracking
CREATE TABLE silver.crm_prd_info(
    prd_id             INT,
    cat_id             NVARCHAR(50),
    prd_key            NVARCHAR(50),
    prd_nm             NVARCHAR(50),
    prd_cost           INT,
    prd_line           NVARCHAR(50),
    prd_start_dt       DATE,
    prd_end_dt         DATE,
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

-- Cleansed sales transactions at the line-item level
CREATE TABLE silver.crm_sales_details(
    sls_ord_num        NVARCHAR(50),
    sls_prd_key        NVARCHAR(50),
    sls_cust_id        INT,
    sls_order_dt       DATE,
    sls_ship_dt        DATE,
    sls_due_dt         DATE,
    sls_sales          INT,
    sls_quantity       INT,
    sls_price          INT,
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

-- =============================================================================
-- SOURCE SYSTEM: ERP (Enterprise Resource Planning)
-- =============================================================================

-- Validated customer PII and demographic details (Source: AZ12)
CREATE TABLE silver.erp_cust_az12 (
    cid                NVARCHAR(50),
    bdate              DATE,
    gen                NVARCHAR(50),
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

-- Standardized geographic and location mapping (Source: A101)
CREATE TABLE silver.erp_loc_a101 (
    cid                NVARCHAR(50),
    cntry              NVARCHAR(50),
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

-- Formatted product categorization and hierarchy (Source: G1V2)
CREATE TABLE silver.erp_px_cat_g1v2 (
    id                 NVARCHAR(50),
    cat                NVARCHAR(50),
    subcat             NVARCHAR(50),
    maintenance        NVARCHAR(50),
    dwh_create_date    DATETIME2 DEFAULT GETDATE()
);
