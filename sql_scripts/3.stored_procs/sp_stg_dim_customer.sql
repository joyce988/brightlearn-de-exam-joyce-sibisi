--create stored procedure for stg_dim_customer
create or alter  procedure [dbo].[sp_create_stg_dim_customer] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[stg_dim_customer]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_dim_customer];

   


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_dim_customer]
    (
    [customerID] INT IDENTITY(1,1) PRIMARY KEY,
    [customer_first_name] [varchar](50) NULL,
	[customer_last_name] [varchar](50) NULL,
	[customer_email] [varchar](50) NULL,
	[customer_phone] [varchar](50) NULL,
	[customer_city] [varchar](50) NULL,
	[customer_province] [varchar](50) NULL,
	[customer_loyalty_tier] [varchar](50) NULL,
	[customer_since] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );

   

    INSERT INTO [stg_brightlearn_store].[dbo].[stg_dim_customer](  customer_first_name, customer_last_name, customer_email, customer_phone,
customer_city, customer_province , customer_loyalty_tier, customer_since
)
SELECT DISTINCT
    customer_first_name, customer_last_name, customer_email, customer_phone,
customer_city, customer_province , customer_loyalty_tier, customer_since
FROM [stg_brightlearn_store].[dbo].[raw_data]

--view data in the table

select * from [stg_brightlearn_store].[dbo].[stg_dim_customer]






    end;