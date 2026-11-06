WITH TRIPS AS (

    SELECT
        RIDE_ID,
        -- RIDEABLE_TYPE,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
        START_STATIO_ID AS START_STATION_ID,
        END_STATION_ID,
        MEMBER_CSUAL AS MEMBER_CASUAL,
        TIMESTAMPDIFF(
            SECOND,
            TO_TIMESTAMP(STARTED_AT),
            TO_TIMESTAMP(ENDED_AT)
        ) AS TRIP_DURATION_SECONDS

    FROM {{ ref('stg_bike') }}

    WHERE RIDE_ID != '"bikeid"'
      AND RIDE_ID != 'bikeid'

)

SELECT
    *
FROM TRIPS