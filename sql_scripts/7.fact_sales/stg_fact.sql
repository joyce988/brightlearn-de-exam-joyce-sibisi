if object_id ('[stg_brightlearn_store].[dbo].[stg_fact_sales]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_fact_sales];

    


    CREATE TABLE [stg_brightlearn_store].[dbo].[stg_fact_sales](
    [salesID] INT IDENTITY(1,1) PRIMARY KEY,
	[storeID] INT ,
	[productID] INT,
	[customerID] INT,
	[supplierID] INT,
	[paymentID] INT,
	[dateID] INT,
    [transaction_amount] [varchar](50) NULL,
	[transaction_discount] [varchar](50) NULL,
	[unit_price] [varchar](50) NULL,
	[cost_price] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[line_amount] [varchar](50) NULL,
	[stock_on_hand] [varchar](50) NULL,
	[reorder_threshold] [varchar](50) NULL,
	[load_date] DATETIME DEFAULT GETDATE()
    );
	 go  

   

    INSERT INTO [stg_brightlearn_store].[dbo].[stg_fact_sales](
    
	transaction_amount,
	transaction_discount,
	unit_price,
	cost_price,
	qty,
	line_amount,
	stock_on_hand,
	reorder_threshold  )
SELECT 
    storeID ,
	productID,
	customerID,
	supplierID,
	paymentID,
	dateID,
	transaction_amount,
	transaction_discount,
	unit_price,
	cost_price,
	qty,
	line_amount,
	stock_on_hand,
	reorder_threshold
    
FROM [stg_brightlearn_store].[dbo].[clean_fact_sales]

--view data in table
select * 
from [stg_brightlearn_store].[dbo].[stg_fact_sales]