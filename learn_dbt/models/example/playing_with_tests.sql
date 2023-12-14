SELECT
    c_custkey
    , c_mktsegment
    , {{ rename_segments('c_mktsegment') }} AS mkt_segment_adjusted
FROM {{ source('sample', 'customer') }}
