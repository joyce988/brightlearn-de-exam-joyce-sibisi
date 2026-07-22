--create stored procedure for clean_dim_payment
create or alter  procedure [dbo].[sp_clean_payment] as

begin

 if object_id ('[stg_brightlearn_store].[dbo].[clean_payment]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_payment];

  


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_payment]
    ([paymentID] INT IDENTITY(1,1) PRIMARY KEY,
    [payment_method] [varchar](50) NULl,
    [load_date] DATETIME DEFAULT GETDATE()
    );

   

    truncate table [stg_brightlearn_store].[dbo].[clean_payment]

  

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_payment](  payment_method
)
SELECT  payment_method
    
FROM [stg_brightlearn_store].[dbo].[stg_payment]

--view data in the table

select * from [stg_brightlearn_store].[dbo].[clean_payment]


    end;