CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    BEGIN TRY
        SET @start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        -- =============================================================================
        -- SOURCE SYSTEM: CRM
        -- =============================================================================
        PRINT '------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '------------------------------------------------';


		SET @start_time = GETDATE();
        -- Loading crm_cust_info
        PRINT '>> Truncating and Loading: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'


		SET @start_time = GETDATE();
        -- Loading crm_prd_info
        PRINT '>> Truncating and Loading: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'



		SET @start_time = GETDATE();
        -- Loading crm_sales_details
        PRINT '>> Truncating and Loading: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'



        -- =============================================================================
        -- SOURCE SYSTEM: ERP
        -- =============================================================================
        PRINT '------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '------------------------------------------------';



		SET @start_time = GETDATE();
        -- Loading erp_cust_az12
        PRINT '>> Truncating and Loading: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'



		SET @start_time = GETDATE();
        -- Loading erp_loc_a101
        PRINT '>> Truncating and Loading: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'



		SET @start_time = GETDATE();
        -- Loading erp_px_cat_g1v2
        PRINT '>> Truncating and Loading: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\Data Engineering\Data Engineer projects (end to end projects)\Data Engineer Portfolio Project (Data With Baraa)\Project I made\Data Files\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds'

        SET @end_time = GETDATE();
        PRINT '------------------------------------------------';
        PRINT 'Success! Bronze Layer Load Completed';
        PRINT 'Total Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '------------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '================================================';
        PRINT 'ERROR OCCURRED DURING LOADING';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT '================================================';
    END CATCH
END;



EXEC  bronze.load_bronze;
