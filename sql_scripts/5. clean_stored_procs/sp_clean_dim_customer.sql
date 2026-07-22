--create stored procedure for clean_customer
create or alter  procedure [dbo].[sp_clean_customer] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[clean_customer]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_customer];

    


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_customer]
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

    

    truncate table [stg_brightlearn_store].[dbo].[clean_customer]

    

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_customer](  customer_first_name, customer_last_name, customer_email, customer_phone,
customer_city, customer_province , customer_loyalty_tier, customer_since
)
select 
      customer_first_name
      ,customer_last_name
      , isnull (customer_email, 'n/a') as customer_email
      ,customer_phone
      ,customer_city
      ,customer_province
      ,customer_loyalty_tier
      ,customer_since
      
from(
select *,
row_number() over (partition by customer_first_name order by customerid desc) as flag
from [stg_brightlearn_store].[dbo].[stg_customer])t
where flag =1 and customerid !=1 

--view data in the table

select * from [stg_brightlearn_store].[dbo].[clean_customer]





    end;