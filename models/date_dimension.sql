with cte as (
    select to_timestamp(STARTED_AT), STARTED_AT from {{ source('demo_soruce', 'bike') }}
)
select * from cte