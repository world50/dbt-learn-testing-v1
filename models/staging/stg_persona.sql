with persona_info as (
select 
    id as persona_id,
    personaid as persona_personaid
from  {{ source('w50_postgres', 'persona')}}
-- RAW_DATALAKE.prod_W50POSTGRES.PERSONA
)
select *
from persona_info