
with posts_with_topic as(
    select *
    from {{ref('stg_combine_post_topic')}}
),
people_info as(
    select *
    from {{ref('stg_combine_sf_person_persona_info')}}
), 
ppl_join_posts as(
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
    posts.post_id as post_msg_id,
    -- posts.persona_id,
    posts.title, 
    posts.body, 
    posts.roomid,
    posts.createdat,
    posts.CONTENTTOPICID,
    posts.topic_name,
    posts.topic_slug,
    posts.ITEMID,
    case 
        when posts.title is not null then 'post'
        when posts.body is not null then 'post'
        else Null
    end as post_or_msg_tag
from people_info ppl 
left join posts_with_topic posts on posts.persona_id = ppl.persona_id
)
select *
from ppl_join_posts

-- remove_dup_from_ppl_join_posts as (
--     select 
--         persona_id,
--         post_id,
--         title,
--         body,
--         post_n_msg_id,
--         roomid,
--         createdat,
--         ROW_NUMBER() over (partition by PERSONA_ID, title, body order by createdat ) _rk
        -- count(*) cnt
    -- from ppl_join_posts
    -- group by   persona_id,post_id, title, body, roomid
    -- having  count(*)<=1
    -- order by count(*) desc
-- )

-- order by createdat desc


-- persona_id = '4b354894-fd26-42e3-a161-90042b0b9b44'

-- Compounding Risk?


-- select persona_id, title, body, createdat
-- from remove_dup_from_ppl_join_msgs
-- where persona_id = '4b354894-fd26-42e3-a161-90042b0b9b44'
-- order by title

-- where body is not  null
-- group by 
-- having  count(*)<=1
-- order by count(*) desc

-- order by createdat desc
-- select ppl.persona_id ,count(*) cnt
-- from people_info ppl
-- group by ppl.persona_id
-- order by cnt DESC