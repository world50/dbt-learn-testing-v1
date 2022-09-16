with person_info as(
select 
    id as person_id,
    jobtitle, 
    lastname, 
    firstname, 
    employername, 
    salesforceid,
    primarygroupid
from {{ source('w50_postgres', 'person')}}
-- from RAW_DATALAKE.PROD_W50POSTGRES.PERSON
)
select *
from person_info