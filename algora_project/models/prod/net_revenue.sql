SELECT
    CEIL(SUM(("unitPrice" * "quantity") * (1 - "discount"))) AS gross_revenue
FROM
    {{ ref("stgOrderDetails")}}
