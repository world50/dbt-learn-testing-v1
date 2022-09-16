with company_profile as (
select *
from  "RAW"."API_TEST_V1"."yf_company_profile"
-- "RAW"."API_TEST_V1"."yf_company_profile"
-- {{ source('yf', 'yf_company_profile')}}
-- RAW_DATALAKE.prod_W50POSTGRES.PERSONA
),
rank_profile_by_date as(
    select *,
    row_number() over (partition by _symbol order by _processed_ts desc) as _date_rank
    from company_profile
),
latest_company_profile as (
    select *
    from rank_profile_by_date
    where _date_rank =1
)
select *
from latest_company_profile