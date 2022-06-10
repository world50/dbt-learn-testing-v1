with customers as (
    select *
    from {{ ref('stg_customers')}}
),
orders as (
    select *
    from {{ ref('stg_orders')}}
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