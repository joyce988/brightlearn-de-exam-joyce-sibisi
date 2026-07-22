--create stored procedure for clean_supplier
create or alter  procedure [dbo].[sp_clean_supplier] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[clean_supplier]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_supplier];

  


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_supplier]
    (
    [supplierID] INT IDENTITY(1,1) PRIMARY KEY,
    [supplier] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
    
 

    truncate table  [stg_brightlearn_store].[dbo].[clean_supplier]

   

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_supplier]( supplier 
)
SELECT supplier 
    
FROM [stg_brightlearn_store].[dbo].[stg_supplier]

    --view data in table
    select * from [stg_brightlearn_store].[dbo].[clean_supplier]

    end;