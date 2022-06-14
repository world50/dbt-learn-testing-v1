select 
  order_date,
  ZEROIFNULL(sum(amount)) as sum_amt
from RAW.DBT_FUNDAMENTALS_PRODUCTION.FCT_ORDERS
group by order_date
order by order_date DESC
limit 10