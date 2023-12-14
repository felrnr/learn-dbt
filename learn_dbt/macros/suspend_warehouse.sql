{% macro suspend(warehouse_name) %}
  {% set sql %}
    ALTER WAREHOUSE {{ warehouse_name }} suspend
  {% endset %}

  {% set table = run_query(sql) %}
  {% do table.print_table() %}
{% endmacro %}