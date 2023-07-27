--- Step 1: Join Products table with ProductCategory table, save the output as product_order table ---
SELECT `Final_Task.Products`.ProdNumber as product_number,
        `Final_Task.Products`.ProdName as product_name,
        `Final_Task.Products`.Price as product_price,
        `Final_Task.ProductCategory`.CategoryName as category_name
 FROM `Final_Task.Products` LEFT JOIN `Final_Task.ProductCategory` 
 ON `Final_Task.Products`.Category=`Final_Task.ProductCategory`.CategoryID ;

--- Step 2: Join Orders table with Customers table, save the output as customer_order table ---
 SELECT `Final_Task.Customers`.CustomerEmail as cust_email,
 `Final_Task.Customers`.CustomerCity as cust_city,
`Final_Task.Orders`.ProdNumber as product_number,
 `Final_Task.Orders`.Quantity as order_qty,
 `Final_Task.Orders`.Date as order_date,
 `Final_Task.Orders`.Quantity as order_qty
 FROM `Final_Task.Orders` LEFT JOIN `Final_Task.Customers` 
 ON `Final_Task.Orders`.CustomerID=`Final_Task.Customers`.CustomerID ;

--- Step 3: Join customer_order table with product_order table ----
SELECT * FROM (SELECT `Final_Task.customer_order`.order_date,
`Final_Task.product_order`.category_name,
`Final_Task.product_order`.product_name,
`Final_Task.product_order`.product_price,
`Final_Task.customer_order`.order_qty,
(`Final_Task.customer_order`.order_qty)*(`Final_Task.product_order`.product_price) as total_sales,
`Final_Task.customer_order`.cust_email,
`Final_Task.customer_order`.cust_city,
 FROM `Final_Task.customer_order` LEFT JOIN `Final_Task.product_order` 
 ON `Final_Task.customer_order`.product_number=`Final_Task.product_order`.product_number)
ORDER BY order_date ;

