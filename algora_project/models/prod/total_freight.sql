SELECT
    CEIL(SUM(freight)) AS total_freight_cost
FROM
    {{ ref("stgOrders") }}