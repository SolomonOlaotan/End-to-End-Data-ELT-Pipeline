SELECT
    s."companyName" AS shipping_company,
    ROUND(SUM(o."freight")) AS cost
FROM
    {{ ref("stgShippers") }} s 
JOIN
    {{ ref("stgOrders") }} o 
ON
    s."shipperId" = o."shipVia"
GROUP BY 
    shipping_company

