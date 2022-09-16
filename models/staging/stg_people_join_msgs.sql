
with msgs as (
    select *
    from {{ref('stg_msgs')}}
),
people_info as(
    select *
    from {{ref('stg_combine_sf_person_persona_info')}}
), 
ppl_join_msgs as(
select 
    ppl.PERSON_ID,
    ppl.PERSONA_PERSONAID,
    ppl.PERSONA_ID,
    ppl.SF_CONTACT_ID,
    ppl.EMPLOYERNAME,
    ppl.JOBTITLE,
    ppl.LASTNAME,
    ppl.FIRSTNAME,
    ppl.NAME,
    ppl.group_name,
    msgs.msg_id as post_msg_id,
    -- posts.persona_id,
    Null as title, 
    msgs.body, 
    msgs.roomid,
    msgs.createdat,
    null as CONTENTTOPICID,
    null as topic_name,
    null as topic_slug,
    null as ITEMID,
    case 
        when msgs.body is not null then 'msg'
        else Null
    end as post_or_msg_tag
from people_info ppl
left join msgs on msgs.persona_id = ppl.persona_id
)
select *
from  ppl_join_msgs 
limit 2
-- remove_dup_from_ppl_join_msgs as (
--     select 
--         persona_id,
--         msg_id,
--         title,
--         body,
--         post_n_msg_id,
--         roomid,
--         createdat,
--         dense_rank() over (partition by PERSONA_ID, body, roomid order by createdat ) _rk
--         -- count(*) cnt
--     from ppl_join_msgs
--     -- group by   persona_id,post_id, title, body, roomid
--     -- having  count(*)<=1
--     -- order by count(*) desc
-- )

-- select persona_id,
--         msg_id,
--         title,
--         body,
--         post_n_msg_id,
--         roomid,
--         createdat,
--         _rk
-- from remove_dup_from_ppl_join_msgs
-- where _rk >=2
-- persona_id in(select persona_id from remove_dup_from_ppl_join_msgs where _rk=2)
-- order by persona_id DESC, body,createdat desc
