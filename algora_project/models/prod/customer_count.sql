SELECT
    COUNT("contactName") AS customer_count
FROM
    {{ ref("stgCustomers") }}