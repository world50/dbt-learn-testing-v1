with announce as (
    select *
    from "BOARDEX"."STANDARDDATA"."TBLBOARDANDDIRECTORANNOUNCEMENTS"
    limit 2
)

select *
from announce