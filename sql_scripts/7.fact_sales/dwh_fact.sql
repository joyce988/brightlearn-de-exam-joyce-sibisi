if object_id ('[dwh_brightlearn_store].[dbo].[dwh_fact_sales]') is not null
    drop table [dwh_brightlearn_store].[dbo].[dwh_fact_sales];

    go


    CREATE TABLE [dwh_brightlearn_store].[dbo].[dwh_fact_sales](
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
    constraint fk_storeID
               foreign key (storeID)
               references [dwh_brightlearn_store].[dbo].[dwh_store] ,
    constraint fk_productID
               foreign key (productID)
               references [dwh_brightlearn_store].[dbo].[dwh_product] ,
    constraint fk_customerID
               foreign key (customerID)
               references [dwh_brightlearn_store].[dbo].[dwh_customers] ,
    constraint fk_supplierID
               foreign key (supplierID)
               references [dwh_brightlearn_store].[dbo].[dwh_supplier] ,
    constraint fk_paymentID
               foreign key (paymentID)
               references [dwh_brightlearn_store].[dbo].[dwh_payment] ,
    constraint fk_dateID
               foreign key (dateID)
               references [dwh_brightlearn_store].[dbo].[dwh_date] ,
    [load_date] DATETIME DEFAULT GETDATE()
    );

    go  

   

    INSERT INTO [dwh_brightlearn_store].[dbo].[dwh_fact_sales](
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
	reorder_threshold  )
SELECT DISTINCT
    sto.storeID ,
	pro.productID,
	cust.customerID,
	sup.supplierID,
	pay.paymentID,
	d.dateID,
	cle.transaction_amount,
	cle.transaction_discount,
	cle.unit_price,
	cle.cost_price,
	cle.qty,
	cle.line_amount,
	cle.stock_on_hand,
	cle.reorder_threshold
    
FROM [stg_brightlearn_store].[dbo].[clean_fact_sales] cle

inner join [dwh_brightlearn_store].[dbo].[dwh_store] sto
on sto.cashier_name = r.cashier_name
and sto.store_name = r.store_name
and	sto.store_city = r.store_city
and	sto.store_province = r.store_province
and	sto.store_region = r.store_region
and	sto.store_manager = r.store_manager

inner join [dwh_brightlearn_store].[dbo].[dwh_product] pro
on pro.product_name = r.product_name
and pro.category = r.category 
and	 pro.sub_category = r.sub_category  
and	pro..sku = r.sku 


inner join [dwh_brightlearn_store].[dbo].[dwh_customers] cust
on cust.customer_first_name = r.customer_first_name  
and cust.customer_last_name = r.customer_last_name   
and	cust.customer_email = r.customer_email  
and	cust.customer_city = r.customer_city   
and	cust.customer_province = r.customer_province  
and cust.customer_loyalty_tier = r.customer_loyalty_tier
and cust.customer_since = r,customer_since


inner join [dwh_brightlearn_store].[dbo].[dwh_supplier] sup
on sup.supplier= r.supplier  

inner join [dwh_brightlearn_store].[dbo].[dwh_payment] pay
on pay.payment_method = r.payment_method 

inner join [dwh_brightlearn_store].[dbo].[dwh_date] d
on d.transaction_date =r.transaction_date;


    --view data in table
    select * from [dwh_brightlearn_store].[dbo].[dwh_fact_sales]