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
    round(avg(temp),2) as avg_temp,
    round(avg(PRESSURE),2)as avg_pressure,
    round(avg(HUMIDITY),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    from daily_weather
    group by date_w,weather
    qualify row_number() over (partition by date_w order by count(weather) desc) =1 order by date_w
)
select * from daily_weather_agg