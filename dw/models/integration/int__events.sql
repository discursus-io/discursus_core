with s_gdelt_events as (

    select * from {{ ref('stg__gdelt__events') }}

), 

s_actor_types as (

    select * from {{ ref('stg__seed__actor_types') }}

), 

s_event_types as (

    select * from {{ ref('stg__seed__event_types') }}

), 

final as (

    select
        s_gdelt_events.gdelt_event_natural_key, 

        s_gdelt_events.published_date, 
        s_gdelt_events.creation_ts, 

        s_gdelt_events.source_url, 
        s_gdelt_events.action_geo_full_name,  
        s_gdelt_events.action_geo_country_code,
        s_gdelt_events.action_geo_adm1_code, 
        s_gdelt_events.action_geo_latitude, 
        s_gdelt_events.action_geo_longitude, 
        s_gdelt_events.actor1_name, 
        s_actor_types1.actor_type as actor1_type, 
        s_gdelt_events.actor2_name, 
        s_actor_types2.actor_type as actor2_type, 
        s_event_types.event_type, 

        s_gdelt_events.goldstein_scale, 
        s_gdelt_events.num_mentions, 
        s_gdelt_events.num_sources, 
        s_gdelt_events.num_articles, 
        s_gdelt_events.avg_tone

    from s_gdelt_events
    left join s_actor_types as s_actor_types1 
        on s_gdelt_events.actor1_type1_code = s_actor_types1.actor_type_code
    left join s_actor_types as s_actor_types2
        on s_gdelt_events.actor2_type1_code = s_actor_types2.actor_type_code
    left join s_event_types using (event_code)

)

select * from final