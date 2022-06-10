select
    customer_id,
    sum(amount) as sum_amount
from raw.dbt_fundamentals_production.fct_orders
group by customer_id