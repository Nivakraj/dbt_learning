with cte as (
    select STARTED_AT from {{ source('demo_soruce', 'bike') }} where started_at !='started_at'
)
select 
to_timestamp(STARTED_AT),
hour(to_timestamp(STARTED_AT)) as Hour,
date(to_timestamp(STARTED_AT)) as date,
month(to_timestamp(STARTED_AT)) as Month,
dayname(to_timestamp(STARTED_AT)) as Day,
{{day_type('STARTED_AT')}},
{{get_season('STARTED_AT')}} 
from cte