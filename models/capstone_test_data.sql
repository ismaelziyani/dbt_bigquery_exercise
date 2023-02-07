{{config(materialized="table")}}

with users as (

    select
        id as user_id,
        first_name as fornavn,
        last_name as efternavn,
        gender,
        ip_address

    from `cloud-consulting-sandbox`.capstone_dataset.capstone_table

),


final as (

    select
        users.user_id,
        users.fornavn,
        users.efternavn,
        users.gender,
        users.ip_address

    from users


)

select * from final