--create table clean_dim_product

if object_id ('[stg_brightlearn_store].[dbo].[clean_dim_product]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_dim_product];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_dim_product]
    ([productID] INT IDENTITY(1,1) PRIMARY KEY,
    [product_name] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[sub_category] [varchar](50) NULL,
	[sku] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );

    go

    truncate table [stg_brightlearn_store].[dbo].[clean_dim_product]
    
    INSERT INTO [stg_brightlearn_store].[dbo].[clean_dim_product]( product_name, category, sub_category, sku 
)
SELECT DISTINCT
    product_name, 
    isnull (category, 'n/a') as category, sub_category, sku 

FROM [stg_brightlearn_store].[dbo].[stg_dim_product]
    --view data in table
    select * from [stg_brightlearn_store].[dbo].[clean_dim_product]