select *
from {{ ref('dim_customers') }}
where dbt_valid_to is null

union all

select
    4 as customer_id,
    'Jefferson' as customer_name,
    'Oklahoma' as city,
    current_timestamp as dbt_valid_from,
    null as dbt_valid_to
