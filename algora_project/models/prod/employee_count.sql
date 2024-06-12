SELECT
    COUNT("employeeId") AS employee_count
FROM
    {{ ref("stgEmployees")}}