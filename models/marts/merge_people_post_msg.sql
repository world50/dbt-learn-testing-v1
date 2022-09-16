with posts as(
    select *
    from {{ref('stg_people_join_posts')}}
),
msgs as (
    select *
    from {{ref('stg_people_join_msgs')}}
),
posts_union_msgs as (
    select *
    from posts
    union 
    select *
    from msgs
)

select *
from posts_union_msgs
where title is not null 












