SELECT
    c."companyName" AS company_name,
    c."contactName" AS customer_name,
    CEIL(SUM(od."unitPrice" * od."quantity" * (1 - od."discount"))) AS TotalRevenue
    --(od."orderID" * ) AS total_order
FROM
    {{ ref('orderDetails') }} od
JOIN
    {{ ref('stgOrders') }} o
ON
    od."orderID" = o."orderId"
JOIN
    {{ ref("stgCustomers")}} c
ON
    o."customerId" = c."customerId"
GROUP BY c."companyName", c."contactName"
ORDER BY 
    3 DESC
LIMIT
    10
