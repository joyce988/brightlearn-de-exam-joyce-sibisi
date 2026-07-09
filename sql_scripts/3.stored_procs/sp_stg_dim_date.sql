--create stored procedure for stg_dim_date
create or alter  procedure [dbo].[sp_create_stg_dim_date] as

begin

if object_id ('[stg_brightlearn_store].[dbo].[stg_dim_date]') is not null
    drop table [stg_brightlearn_store].[dbo].[stg_dim_date];

   


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_dim_date]
    ([dateID] INT IDENTITY(1,1) PRIMARY KEY,
    [transaction_date] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
   

    
    INSERT INTO [stg_brightlearn_store].[dbo].[stg_dim_date](  transaction_date
)
SELECT DISTINCT
    transaction_date
FROM [stg_brightlearn_store].[dbo].[raw_data]

    --view data in table
   select *from  [stg_brightlearn_store].[dbo].[stg_dim_date]

    end;