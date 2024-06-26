SELECT
  o.date AS order_date,
  pc.CategoryName AS category_name,
  p.ProdName AS product_name,
  ROUND(p.price, 2) AS product_price,
  od.quantity AS order_quantity,
  ROUND(p.price * od.quantity, 2) AS total_sales,
  c.CustomerEmail AS customer_email,
  c.CustomerCity AS customer_city
FROM
  biproject.customer c LEFT JOIN biproject.order o
  ON (c.CustomerID = o.CustomerID)
  LEFT JOIN biproject.order_detail od
  ON (o.OrderID = od.OrderID)
  INNER JOIN biproject.product p
  ON (od.ProdNumber = p.ProdNumber)
  INNER JOIN biproject.product_category pc
  ON (p.category = pc.CategoryID)
ORDER BY o.Date;