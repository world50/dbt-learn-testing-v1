with date_seq_table as(
    select * from stg_last_10_days_seq_date
),
daily_order_values_table as(
    select * from stg_last_10_days_order_amount
)
select 
    date_seq_table.seq_date, 
    zeroifnull(daily_order_values_table.sum_amt)  sum_amt
from date_seq_table left join daily_order_values_table
on date(date_seq_table.seq_date) = date(daily_order_values_table.order_date)
order by date_seq_table.seq_date DESC