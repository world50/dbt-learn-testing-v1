with posts as(
    select *
    from {{ref('stg_posts')}}
),
topics as(
    select *
    from {{ref('stg_topic')}}
),
merge_posts_topics as(
    select 
        p.*,
        t.*
    from posts p 
    left  join topics t on p.post_id = t.itemid
)
select *
from merge_posts_topics
order by createdat desc
-- select count(distinct post_id)
-- from merge_posts_topics



-- where post_id = 'fabb9412-ba4d-49ff-82b9-7426a730d9a2'
-- where post_id = 'fabb9412-ba4d-49ff-82b9-7426a730d9a2' 'ab5e0623-bb35-46d7-86b8-47228f405813'
-- where post_id is not null and itemid is not null