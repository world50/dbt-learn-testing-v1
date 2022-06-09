with customers as (
    select
        customer_id,
        first_name,
        last_name
    from RAW.DBT_FUNDAMENTALS_PRODUCTION.DIM_CUSTOMERS
),
orders as (
    select
        customer_id,
        sum(amount) as sum_amount
    from raw.dbt_fundamentals_production.fct_orders
    group by customer_id
),
final as (
    select 
        c.customer_id,
        c.first_name,
        c.last_name,
        zeroifnull(o.sum_amount) as sum_amount
    from customers c left join orders o on (c.customer_id = o.customer_id)
)

select * from final order by sum_amount DESC