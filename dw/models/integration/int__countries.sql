with s_countries as (

    select * from {{ ref('stg__seed__fips_countries') }}

)

select * from s_countries