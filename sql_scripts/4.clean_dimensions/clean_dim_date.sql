--create clean_dim_date

 if object_id ('[stg_brightlearn_store].[dbo].[clean_dim_date]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_dim_date];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_dim_date]
    ([dateID] INT IDENTITY(1,1) PRIMARY KEY,
    [transaction_date] [varchar](50) NULL,

   
    INSERT INTO [stg_brightlearn_store].[dbo].[clean_dim_date]
SELECT 
 transaction_date,
    COALESCE(
        TRY_CONVERT(DATE, transaction_date, 101), -- Try MM/DD/YYYY
        TRY_CONVERT(DATE, transaction_date, 103), -- Try DD/MM/YYYY
        TRY_CONVERT(DATE, transaction_date)       -- Try default/implicit
    ) AS transaction_date
 
    --view data in table
   select *from  [stg_brightlearn_store].[dbo].[clean_dim_date]