--create table clean_dim_supplier

if object_id ('[stg_brightlearn_store].[dbo].[clean_supplier]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_supplier];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_supplier]
    (
    [supplierID] INT IDENTITY(1,1) PRIMARY KEY,
    [supplier] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
    
    go 

    truncate table  [stg_brightlearn_store].[dbo].[clean_supplier]

    go

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_supplier]( supplier 
)
SELECT DISTINCT supplier 
    
FROM [stg_brightlearn_store].[dbo].[stg_supplier]

    --view data in table
    select * from [stg_brightlearn_store].[dbo].[clean_supplier]