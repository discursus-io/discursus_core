with s_countries as (

  select * from {{ ref('int__countries') }}


),

final as (

  select
    {{ dbt_utils.surrogate_key(
      ['country_code']
    ) }} as country_pk, 

    country_code, 
    country_name

  from s_countries

)

select * from final
