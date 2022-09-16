with person as (
    select *
    from {{ ref('stg_person') }}
    ),
persona as(
    select *
    from {{ref('stg_persona')}}
),
sf_contact as (
    select *
    from {{ref('stg_sf_contact')}}
),
groups as(
    select *
    from {{ref('stg_group')}}
),
combine_sf_person_persona_info as (
select  
    person.person_id, 
    persona.persona_personaid, 
    persona.persona_id, 
    -- person.salesforceid, 
    sf_contact.sf_contact_id,
    person.employername,
    person.jobtitle, 
    person.lastname, 
    person.firstname, 
    sf_contact.name,
    groups.name as group_name
from 
person
left join groups on groups.id = person.primarygroupid
join persona on person.person_id = persona.persona_personaid
join sf_contact on sf_contact.sf_contact_id = person.salesforceid
)

select *
from combine_sf_person_persona_info
