SELECT
    c."country" AS country,
    COUNT (DISTINCT c."customerId") AS customer_count,
    (COUNT (DISTINCT o."orderId")) AS order_count
FROM
    {{ ref("stgCustomers") }} c 
JOIN 
    {{ ref("stgOrders") }} o 
ON 
    c."customerId" = O."customerId"
GROUP BY 
    country
ORDER BY 
    2 DESC