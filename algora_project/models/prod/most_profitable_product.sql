/*Top 10 Profitable Products*/
SELECT
	sP."productName" AS product, 
	ROUND(SUM(od."unitPrice" * od.quantity * (1 - od.discount))) as prod_revenue
FROM
	{{ ref('stgProducts') }} sP
JOIN  
	{{ ref('stgOrderDetails') }} od
ON 
	od."productID" = sP."productId"
GROUP BY 
	product
ORDER BY 
	prod_revenue DESC
LIMIT 10