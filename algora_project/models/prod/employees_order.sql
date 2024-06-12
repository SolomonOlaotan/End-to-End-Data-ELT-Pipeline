SELECT  
    e."lastName",
    e."firstName",
    COUNT(DISTINCT od."orderID") AS order_processed_by_employees
FROM   
    {{ ref("stgEmployees") }} e 
JOIN 
    {{ ref("stgOrders") }} o 
ON
    e."employeeId" = o."employeeId"
JOIN
    {{ ref("stgOrderDetails") }} od
ON
    o."orderId" = od."orderID"
GROUP BY e."lastName", e."firstName"
ORDER BY
    3 DESC