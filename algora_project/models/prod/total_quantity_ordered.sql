SELECT
    CEIL(SUM("quantity")) AS total_quantity_ordered
FROM
    {{ ref("orderDetails") }}