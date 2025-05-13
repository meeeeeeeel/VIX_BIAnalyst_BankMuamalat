CREATE TABLE `pt_sejahtera_bersama.tabel_master` AS 
SELECT
  -- Mengubah datatype Date yang berupa STRING menjadi DATE
  PARSE_DATE('%m/%d/%Y', o.Date) AS order_date, 
  pc.CategoryName AS category_name, 
  p.ProdName AS product_name, 
  p.Price AS product_price, 
  o.Quantity AS order_qty, 
  -- Menghitung total_sales
  o.Quantity * p.Price AS total_sales, 
  c.CustomerEmail AS cust_email, 
  c.CustomerCity AS cust_city 
FROM `pt_sejahtera_bersama.Orders` o 
JOIN `pt_sejahtera_bersama.Customers` c 
  ON o.CustomerID = c.CustomerID -- Menggabungkan tabel Orders (o) dengan tabel Customers (c)
JOIN `pt_sejahtera_bersama.Products` p 
  ON o.ProdNumber = p.ProdNumber -- Menggabungkan tabel Orders (o) dengan tabel Products (p)
JOIN `pt_sejahtera_bersama.ProductCategory` pc
  ON p.Category = pc.CategoryID -- Menggabungkan tabel Products (p) dengan tabel ProductCategory (pc)
ORDER BY order_date ASC; -- Mengurutkan data dari tanggal transaksi paling awal sampai tanggal paling akhir
