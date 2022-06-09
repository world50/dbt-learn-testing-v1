with customers as (
    select
        customer_id,
        first_name,
        last_name
    from RAW.DBT_FUNDAMENTALS_PRODUCTION.DIM_CUSTOMERS
)

select * from customers