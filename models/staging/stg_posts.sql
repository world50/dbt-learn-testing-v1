with posts as (
select 
    id as post_id,
    personaid as persona_id,
    title, 
    body, 
    roomid,
    createdat
from RAW_DATALAKE.prod_W50POSTGRES.POST
)
select *
from posts