{% macro dynamic_total_sales(
    source_relation,
    amount_column,
    where_clause=None,
    start_date=None,
    end_date=None
) %}

select
    sum({{ amount_column }}) as total_sales
from {{ source_relation }}

{% if where_clause %}
where {{ where_clause }}

{% elif start_date and end_date %}
where order_date between {{ start_date }} and {{ end_date }}

{% endif %}

{% endmacro %}
