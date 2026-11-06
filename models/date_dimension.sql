with cte as (
    select STARTED_AT from {{ ref('stg_bike') }} where started_at !='started_at'
)
select 
to_timestamp(STARTED_AT) as STARTED_AT,
hour(to_timestamp(STARTED_AT)) as Hour,
date(to_timestamp(STARTED_AT)) as date,
month(to_timestamp(STARTED_AT)) as Month,
dayname(to_timestamp(STARTED_AT)) as Day,
{{day_type('STARTED_AT')}} as day_type,
{{get_season('STARTED_AT')}} as  Station_of_the_year
from cte