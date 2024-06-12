SELECT
    (SUM("unitPrice" * "quantity")) AS gross_revenue
FROM
    {{ ref("stgOrderDetails")}}