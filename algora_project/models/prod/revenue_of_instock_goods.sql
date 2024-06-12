WITH CTE_Instock_volume AS (
    SELECT 
    p."productName" AS product, 
    s."companyName" AS supplier, 
    s."contactName", 
    c."categoryName" AS category, 
    SUM(p."unitPrice" * p."unitsInStock") AS stock_amount 
    FROM {{ ref("stgProducts")}} p
    JOIN
        {{ ref("stgSuppliers")}} s
    ON  
    p."supplierId" = s."supplierId"
    JOIN
        {{ ref("stgCategories")}} c
    ON
        s."supplierId" = c."categoryId"
    GROUP BY p."productName", s."companyName", s."contactName", c."categoryName"

)
SELECT supplier, product, category, stock_amount
FROM CTE_Instock_volume
ORDER BY 
    4 DESC
