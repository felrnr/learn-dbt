{{
  config(
    materialized = 'table',
    tags=["nightly", "example"]
    )
}}

WITH source_data AS (
    SELECT 1 AS id, 'NY' AS state, '2020-02-01 01:00:00.000'::timestamp AS updated_at
    UNION ALL
    SELECT 2 AS id, 'CT' AS state, '2020-01-01 00:00:00.000'::timestamp AS updated_at
    UNION ALL
    SELECT 3 AS id, 'VT' AS state, '2020-01-01 00:00:00.000'::timestamp AS updated_at
)

SELECT *
FROM source_data
