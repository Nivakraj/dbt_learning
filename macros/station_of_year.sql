{% macro get_season(x) %}
case when month(to_timestamp({{x}})) in (1,11,12)
then 'Winter'
when month(to_timestamp({{x}})) in (3,4,5)
then 'Spring'
when month(to_timestamp({{x}})) in (6,7,8)
then 'Summer'
else 'Autumn' end
{% endmacro %}

{% macro day_type(x) %}
case when dayname(to_timestamp({{x}})) in ('Sun','Sat')
then 'Weekend'
else 'Weekday'
end
{% endmacro %}