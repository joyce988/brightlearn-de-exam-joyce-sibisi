--create stored procedure for clean_date
create or alter  procedure [dbo].[sp_clean_date] as

begin

 if object_id ('[stg_brightlearn_store].[dbo].[clean_date]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_date];

   


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_date]
    ([dateID] INT IDENTITY(1,1) PRIMARY KEY,
    [transaction_date] [varchar](50) NULL,
    [load_date] DATETIME DEFAULT GETDATE()
    );
    

    truncate table [stg_brightlearn_store].[dbo].[clean_date]

   


    INSERT INTO [stg_brightlearn_store].[dbo].[clean_date](  transaction_date
)
SELECT DISTINCT 
   TRY_convert (DATE,transaction_date, 103) as transaction_date
FROM [stg_brightlearn_store].[dbo].[stg_date]

    --view data in table
   select *from  [stg_brightlearn_store].[dbo].[clean_date]

    end;