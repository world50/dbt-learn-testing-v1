with groups as (
    select 
        id,
        name,
        salesforceid
    from {{ source('w50_postgres','group') }}  
)
select *
from groups


