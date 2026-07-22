--create stored procedure for stg_product
create or alter  procedure [dbo].[sp_create_stg_product] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[stg_product]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_product];

  


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_product]
    ([productID] INT IDENTITY(1,1) PRIMARY KEY,
    [product_name] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[sub_category] [varchar](50) NULL,
	[sku] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );

  
truncate table [stg_brightlearn_store].[dbo].[stg_product]
INSERT INTO [stg_brightlearn_store].[dbo].[stg_product]( product_name, category, sub_category, sku 
)
SELECT DISTINCT
    product_name, category, sub_category, sku 

FROM [stg_brightlearn_store].[dbo].[raw_data]
   

   end;


    