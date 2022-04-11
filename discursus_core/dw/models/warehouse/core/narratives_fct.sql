{{ 
    config(
        unique_key='narrative_pk'
    )
}}

with s_narratives as (

    select * from {{ ref('int__narratives') }}

),

s_events as (

    select * from {{ ref('int__events') }}

),

filter_narratives as (

    select 
        s_narratives.*

    from s_narratives
    inner join s_events using (gdelt_event_natural_key)

),

final as (

    select distinct
        {{ dbt_utils.surrogate_key([
        'gdelt_event_natural_key',
        'actor_name',
        'actor_code',
        'actor_geo_country_code'
        ]) }} as narrative_pk,
        {{ dbt_utils.surrogate_key(['gdelt_event_natural_key']) }} as event_fk,
        {{ dbt_utils.surrogate_key([
        'actor_name',
        'actor_code',
        'actor_geo_country_code'
        ]) }} as actor_fk,

        narrative

    from filter_narratives

)

select * from final