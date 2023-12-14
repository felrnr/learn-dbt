{{ config(materialized='table') }}

WITH orders AS (
    SELECT o_orderdate as order_date
        , o_totalprice as price
    FROM {{ source('sample', 'orders') }}
)
, order_value_by_date AS (
    SELECT
        order_date
        , SUM(price) AS total_value
    FROM orders
    GROUP BY 1
)
, cumulative_value_by_date AS (
    SELECT
        order_date
        , SUM(total_value) OVER (ORDER BY order_date ASC) AS cumulative_value
    FROM order_value_by_date
)
SELECT *
FROM cumulative_value_by_date
ORDER BY order_date