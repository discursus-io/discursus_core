{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    alias='events_fct',
    unique_key='event_pk'
  )
}}

with s_events as (

  select * from {{ ref('int__events') }}

  {% if is_incremental() %}
      where creation_ts > (select max(creation_ts) from {{ this }})
  {% endif %}


),

final as (

  select
    {{ dbt_utils.surrogate_key(
      ['gdelt_event_natural_key']
    ) }} as event_pk, 

    {{ dbt_utils.surrogate_key(
      ['action_geo_country_code']
    ) }} as country_fk, 

    gdelt_event_natural_key, 

    published_date, 
    creation_ts, 

    source_url, 
    action_geo_full_name,  
    action_geo_adm1_code, 
    action_geo_latitude, 
    action_geo_longitude, 
    actor1_name, 
    actor1_type, 
    actor2_name, 
    actor2_type, 
    event_type, 

    goldstein_scale, 
    num_mentions, 
    num_sources, 
    num_articles, 
    avg_tone

  from s_events

)

select * from final
