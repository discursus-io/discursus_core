{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    alias='events_fact',
    unique_key='event_pk'
  )
}}

with s_events as (

  select * from {{ ref('int_events') }}


),

final as (

  select
    {{ dbt_utils.surrogate_key(
      ['gdelt_event_natural_key']
    ) }} as event_pk, 

    gdelt_event_natural_key, 

    published_date, 
    creation_ts, 

    source_url, 
    action_geo_full_name, 
    action_geo_country_code, 
    action_geo_adm1_code, 
    action_geo_lat, 
    action_geo_long, 
    actor1_name, 
    actor1_type1_code, 
    actor2_name, 
    actor2_type1_code, 
    event_code, 

    goldstein_scale, 
    num_mentions, 
    num_sources, 
    num_articles, 
    avg_tone


  from s_events

  {% if is_incremental() %}
      where creation_ts > (select max(creation_ts) from {{ this }})
  {% endif %}

)

select * from final
