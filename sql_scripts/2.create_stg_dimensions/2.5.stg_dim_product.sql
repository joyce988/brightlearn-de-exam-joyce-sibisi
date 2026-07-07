--create table stg_dim_product

if object_id ('[stg_brightlearn_store].[dbo].[stg_dim_product]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_dim_product];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_dim_product]
    ([productID] INT IDENTITY(1,1) PRIMARY KEY,
    [product_name] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[sub_category] [varchar](50) NULL,
	[sku] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
    
    --view data in table
    select * from [stg_brightlearn_store].[dbo].[stg_dim_product]