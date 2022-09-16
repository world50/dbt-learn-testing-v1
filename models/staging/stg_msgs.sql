with msgs as (
select 
    id as msg_id,
    personaid as persona_id, 
    BODY, 
    ROOMID,  
    createdat,
    jsonbody
from RAW_DATALAKE.prod_W50POSTGRES.MESSAGE
)
select *
from msgs