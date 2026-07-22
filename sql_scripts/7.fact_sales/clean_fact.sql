if object_id ('[stg_brightlearn_store].[dbo].[clean_fact_sales]') is not null
    drop table [stg_brightlearn_store].[dbo].[clean_fact_sales];

    go


    CREATE TABLE [stg_brightlearn_store].[dbo].[clean_fact_sales](
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

   

    INSERT INTO [stg_brightlearn_store].[dbo].[clean_fact_sales](
    storeID,
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
	reorder_threshold  )
SELECT  
    storeID,
	productID,
	customerID,
	supplierID,
	paymentID,
	dateID,
	cast (transaction_amount as decimal (18,0)) as transaction_amount ,
	cast (transaction_discount as decimal (18,0)) as transaction_discount ,
	cast ( unit_price as decimal (18,0)) as unit_price ,
	cast (cost_price as decimal (18,0)) as cost_price ,
	cast (qty as INT) as qty,
	cast (line_amount as decimal (18,0)) as line_amount ,
	cast (stock_on_hand as INT) as stock_on_hand,
	cast (reorder_threshold as INT) as reorder_threshold

    
FROM [stg_brightlearn_store].[dbo].[stg_fact_sales]

--view data in table
select * 
from [stg_brightlearn_store].[dbo].[clean_fact_sales]