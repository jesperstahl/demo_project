{{ config(
    materialized = 'incremental',
    unique_key   = 'order_id'
) }}

select
    order_id,
    order_date,
    customer_id,
    order_amount,
    status
from public.stg_orders

{% if is_incremental() %}
    -- On incremental runs, only load rows with an order_id
    -- greater than the max already loaded in {{ this }}
    where order_id > (
        select coalesce(max(order_id), 0)
        from {{ this }}
    )
{% endif %}