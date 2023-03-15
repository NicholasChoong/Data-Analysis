/* Contact @Nur Al Hasan Haldar for any query
 * HOW TO RUN THIS SCRIPT:
 *
 * 1. Enable full-text search on your SQL Server instance. 
 *
 * 2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
 *    This option is in the Query menu.
 *
 * 3. Copy this script and the install files to C:\Samples\NewSalesDW_Diagram, or
 *    set the following environment variable to your own data path.
 */
 :setvar SqlSamplesSourceDataPath "E:\OneDrive - The University of Western Australia\CITS3401\Project\"

/*
 * 4. Append the SQL Server version number to database name if you want to
 *    differentiate it from other installs of AdventureWorksDW (previous lab sample DW)
 */

:setvar DatabaseName "JobPostsDW"

/* Execute the script to insert data
 */

BULK INSERT [dbo].[DimLocation] FROM '$(SqlSamplesSourceDataPath)dim_location.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimDate] FROM '$(SqlSamplesSourceDataPath)dim_date.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimJob] FROM '$(SqlSamplesSourceDataPath)dim_job.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR='|',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimBoard] FROM '$(SqlSamplesSourceDataPath)dim_board.csv'
WITH ( 
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimCompany] FROM '$(SqlSamplesSourceDataPath)dim_company.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimJobType] FROM '$(SqlSamplesSourceDataPath)dim_job_type.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[FactJobPosts] FROM '$(SqlSamplesSourceDataPath)fact_table.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR='~',
    ROWTERMINATOR='\n',
    KEEPIDENTITY,
    TABLOCK
);


