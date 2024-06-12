SELECT
    p."productName" AS product,
    COUNT (DISTINCT od."orderID"), 
    p."unitsOnOrder" AS order_level,
    p."reorderLevel" AS reorder_Level
FROM
    {{ ref("stgProducts") }} p
JOIN 
    {{ ref("stgOrderDetails") }} od 
ON
    p."productId" = od."productID"
GROUP BY
    product, order_level, reorder_level 
ORDER BY
 3 DESC
LIMIT   10