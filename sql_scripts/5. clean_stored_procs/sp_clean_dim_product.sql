--create stored procedure for clean_product
create or alter  procedure [dbo].[sp_clean_product] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[clean_product]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_product];

    


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_product]
    ([productID] INT IDENTITY(1,1) PRIMARY KEY,
    [product_name] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[sub_category] [varchar](50) NULL,
	[sku] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );

    

    truncate table [stg_brightlearn_store].[dbo].[clean_product]
    
    INSERT INTO [stg_brightlearn_store].[dbo].[clean_product]( product_name, category, sub_category, sku 
)
SELECT 
    product_name, 
    isnull (category, 'n/a') as category, sub_category, sku 

FROM [stg_brightlearn_store].[dbo].[stg_product]
    --view data in table
    select * from [stg_brightlearn_store].[dbo].[clean_product]

    end;