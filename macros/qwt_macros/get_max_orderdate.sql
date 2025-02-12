{% macro get_max_orderdate() %}
 
{% set lineno_query %}

select max(orderdate) as max_order_date
from {{ ref('fct_orders') }}
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}