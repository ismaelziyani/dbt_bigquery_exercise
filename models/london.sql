{{config(materialized="table")}}

with incidents as (

    select
        unique_key,
        descript as incident_description,
        date as incident_year

    from `bigquery-public-data`.austin_incidents.incidents_2016

),

crime as (

    select
        unique_key,
        description as crime_description,
        year as crime_year

    from `bigquery-public-data`.austin_crime.crime

),

final as (

    select
        incidents.unique_key,
        incidents.incident_description,
        incidents.incident_year,
        crime.crime_description,
        crime.crime_year

    from incidents

    right join crime using (unique_key)

)

select * from final WHERE unique_key IS NOT NULL Limit 100