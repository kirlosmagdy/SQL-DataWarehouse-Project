/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Description:
    This script creates the tables in the 'bronze' schema. 
    The bronze layer serves as the landing zone for raw data extracted from 
    source systems (CRM and ERP). No transformations are applied at this stage.

Usage:
    - Run this script to initialize the bronze layer structure.
    - Tables are prefixed by their source system (crm_ or erp_).
===============================================================================
*/





-- =============================================================================
-- SOURCE SYSTEM: CRM (Customer Relationship Management)
-- =============================================================================


-- Stores raw customer demographic information from the CRM system
CREATE TABLE bronze.crm_cust_info(
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(50),
    cst_lastname       NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr           NVARCHAR(50),
    cst_create_date    DATE
);

-- Stores product definitions and historical cost attributes
CREATE TABLE bronze.crm_prd_info(
    prd_id             INT,
    prd_key            NVARCHAR(50),
    prd_nm             NVARCHAR(50),
    prd_cost           INT,
    prd_line           NVARCHAR(50),
    prd_start_dt       DATETIME,
    prd_end_dt         DATETIME
);

-- Stores transactional sales details at the order line level
CREATE TABLE bronze.crm_sales_details(
    sls_ord_num        NVARCHAR(50),
    sls_prd_key        NVARCHAR(50),
    sls_cust_id        INT,
    sls_order_dt       INT,
    sls_ship_dt        INT,
    sls_due_dt         INT,
    sls_sales          INT,
    sls_quantity       INT,
    sls_price          INT
);



-- =============================================================================
-- SOURCE SYSTEM: ERP (Enterprise Resource Planning)
-- =============================================================================

-- Stores raw customer birthdate and gender details (Source: AZ12)
CREATE TABLE bronze.erp_cust_az12 (
    cid                NVARCHAR(50),
    bdate              DATE,
    gen                NVARCHAR(50)
);

-- Stores customer location and country mapping (Source: A101)
CREATE TABLE bronze.erp_loc_a101 (
    cid                NVARCHAR(50),
    cntry              NVARCHAR(50)
);

-- Stores product categories, subcategories, and maintenance flags (Source: G1V2)
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id                 NVARCHAR(50),
    cat                NVARCHAR(50),
    subcat             NVARCHAR(50),
    maintenance        NVARCHAR(50)
);



