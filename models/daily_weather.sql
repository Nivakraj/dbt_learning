with daily_weather as (
    select date(time) as date_w,
    weather,
    temp,
    PRESSURE,
    HUMIDITY,
    clouds from 
    {{ source('demo_soruce', 'weather') }} --limit 10
),
daily_weather_agg as (
    select date_w,
    weather,
    --count(weather) as total,
    avg(temp),
    avg(PRESSURE),
    avg(HUMIDITY),
    avg(clouds)
    from daily_weather
    group by date_w,weather
    qualify row_number() over (partition by date_w order by count(weather) desc) =1 order by date_w
)
-- daily_weather_agg_one as 
-- (
--     select 
-- )
select * from daily_weather_agg