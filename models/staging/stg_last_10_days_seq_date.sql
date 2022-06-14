select 
    dateadd(day, '-'||seq4(), current_date()) as seq_date
from 
    Table(generator(rowcount =>10))