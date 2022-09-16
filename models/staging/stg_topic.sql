with combine_topic_content as (
select 
    -- t.id as topic_id, 
    ta.contenttopicid,
    ta.name as topic_name, 
    ta.slug as topic_slug, 
    map.itemid
-- from RAW_DATALAKE.DEVLIVE_W50POSTGRES.CONTENT_TOPIC t
from RAW_DATALAKE.PROD_W50POSTGRES.CONTENT_TOPIC_ALIAS ta
right JOIN RAW_DATALAKE.PROD_W50POSTGRES.ENTITY_CONTENT_TOPIC_MAP map ON MAP.CONTENTTOPICID = ta.CONTENTTOPICID
)

select *
from combine_topic_content

