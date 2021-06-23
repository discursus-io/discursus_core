with gdelt_events as (

    select * from {{ ref('stg_gdelt_events') }}

)

select * from gdelt_events