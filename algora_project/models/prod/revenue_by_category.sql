SELECT
	c."categoryName" AS category,
	sP."productName" AS product, 
	ROUND(SUM(od."unitPrice" * od.quantity * (1 - od.discount))) as prod_revenue
FROM
	{{ ref("stgCategories")}} c 
JOIN 
	{{ ref('stgProducts') }} sP
ON	
	C."categoryId" = sP."productId"
JOIN  
	{{ ref('stgOrderDetails') }} od
ON 
	od."productID" = sP."productId"
GROUP BY 
	category, product
ORDER BY 
	prod_revenue DESC
LIMIT 8