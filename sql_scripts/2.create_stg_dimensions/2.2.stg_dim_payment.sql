--create stg_dim_payment

 if object_id ('[stg_brightlearn_store].[dbo].[stg_dim_payment]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_dim_payment];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_dim_payment]
    ([paymentID] INT IDENTITY(1,1) PRIMARY KEY,
    [payment_method] [varchar](50) NULl,
    [load_date] DATETIME DEFAULT GETDATE()
    );

    
    INSERT INTO [stg_brightlearn_store].[dbo].[stg_dim_payment](  payment_method
)
SELECT DISTINCT payment_method
    
FROM [stg_brightlearn_store].[dbo].[raw_data]

--view data in the table

select * from [stg_brightlearn_store].[dbo].[stg_dim_payment]
