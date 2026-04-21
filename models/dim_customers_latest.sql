
select
    customer_id,
    customer_name,
    city,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('dim_customers') }}
where dbt_valid_to is null

union all


select
    4 as customer_id,
    'Jefferson' as customer_name,
    'Oklahoma' as city,
    current_timestamp as dbt_valid_from,
    null as dbt_valid_to
