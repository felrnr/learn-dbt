{{ config(materialized='incremental', unique_key='t_time') }}

SELECT *
FROM {{ source('sample_datetimes', 'time_dim') }}
WHERE to_time(concat(t_hour, ':', t_minute, ':', t_second)) <= current_time()

{% if is_incremental() %}
    AND t_time > (SELECT max(t_time) FROM {{ this }} )
{% endif %}
