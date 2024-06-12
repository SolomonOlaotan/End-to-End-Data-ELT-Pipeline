SELECT
    c."companyName",
    c."contactName",
    COUNT(od."orderID") AS total_order
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
