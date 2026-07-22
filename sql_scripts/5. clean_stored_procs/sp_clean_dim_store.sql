--create stored procedure for clean_dim_store
create or alter  procedure [dbo].[sp_clean_store] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[clean_store]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_store];

 


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_store]
    ([storeID] INT IDENTITY(1,1) PRIMARY KEY,
    [cashier_name] [varchar](50) NULL,
    [store_name] [varchar](50) NULL,
	[store_city] [varchar](50) NULL,
	[store_province] [varchar](50) NULL,
	[store_region] [varchar](50) NULL,
	[store_manager] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );

 

    truncate table [stg_brightlearn_store].[dbo].[clean_store];

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_dim_store]( cashier_name,store_name, 
    store_city, store_province,  store_region, store_manager )
SELECT DISTINCT
     cashier_name,store_name, 
    store_city, store_province,  store_region, store_manager
FROM [stg_brightlearn_store].[dbo].[stg_store]

    --view data in table
    select * from [stg_brightlearn_store].[dbo].[stg_store]


    end;