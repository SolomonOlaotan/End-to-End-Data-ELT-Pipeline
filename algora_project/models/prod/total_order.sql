SELECT
(COUNT(DISTINCT "orderID"))
FROM
    {{ ref("stgOrderDetails")}}