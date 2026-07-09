--create stored procedure for stg_dim_supplier
create or alter  procedure [dbo].[sp_create_stg_dim_supplier] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[stg_dim_supplier]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_dim_supplier];

    


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_dim_supplier]
    (
    [supplierID] INT IDENTITY(1,1) PRIMARY KEY,
    [supplier] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
    
  


    INSERT INTO [stg_brightlearn_store].[dbo].[stg_dim_supplier]( supplier 
)
SELECT DISTINCT supplier 
    
FROM [stg_brightlearn_store].[dbo].[raw_data]

    --view data in table
    select * from [stg_brightlearn_store].[dbo].[stg_dim_supplier]

    end;