{% snapshot my_dimension_snapshot %}

{{
   config(
       target_database='analytics',
       target_schema='snapshots',
       unique_key='id',

       strategy='timestamp',
       updated_at='updated_at',
   )
}}

SELECT *
FROM {{ ref('my_dimension') }}

{% endsnapshot %}