{{ config(materialized='table') }}

WITH customer AS (
    SELECT
        c_custkey as customer_id
        , c_name as name
        , c_nationkey as nation
    FROM {{ source('sample', 'customer') }}
)
, orders AS (
    SELECT
        o_custkey AS customer_id
        , o_totalprice AS  price
    FROM {{ source('sample', 'orders') }}
)
SELECT
    customer.customer_id
    , customer.name
    , customer.nation
    , sum(orders.price) as total_order_price
FROM customer
LEFT JOIN orders USING (customer_id)

{{ group_by(3) }}
