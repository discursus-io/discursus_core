with source as (

    select * from {{ source('gdelt', 'gdelt_events') }}

),

final as (

    select distinct
        cast(gdelt_id as bigint) as gdelt_event_natural_key,
        to_date(
            case when published_date = '' then null else published_date end,
            'yyyymmdd'
        ) as published_date,
        cast(
            case when published_date_my = '' then null else published_date_my end
            as integer
        ) as published_date_my,
        cast(
            case when published_date_year = '' then null else published_date_year end
            as integer
        ) as published_date_year,
        cast(
            case when published_date_fraction_date = '' then null else published_date_fraction_date	end
            as numeric(8,4)
        ) as published_date_fraction_date,
        cast(actor1_code as string) as actor1_code,
        cast(actor1_name as string) as actor1_name,
        cast(actor1_country_code as string) as actor1_country_code,
        cast(actor1_known_group_code as string) as actor1_known_group_code,
        cast(actor1_ethnic_code as string) as actor1_ethnic_code,
        cast(actor1_religion1_code as string) as actor1_religion1_code,
        cast(actor1_religion2_code as string) as actor1_religion2_code,
        cast(actor1_type1_code as string) as actor1_type1_code,
        cast(actor1_type2_code as string) as actor1_type2_code,
        cast(actor1_type3_code as string) as actor1_type3_code,
        cast(actor2_code as string) as actor2_code,
        cast(actor2_name as string) as actor2_name,
        cast(actor2_country_code as string) as actor2_country_code,
        cast(actor2_known_group_code as string) as actor2_known_group_code,
        cast(actor2_ethnic_code as string) as actor2_ethnic_code,
        cast(actor2_religion1_code as string) as actor2_religion1_code,
        cast(actor2_religion2_code as string) as actor2_religion2_code,
        cast(actor2_type1_code as string) as actor2_type1_code,
        cast(actor2_type2_code as string) as actor2_type2_code,
        cast(actor2_type3_code as string) as actor2_type3_code,
        cast(is_root_event as integer) as is_root_event,
        cast(event_code as string) as event_code,
        cast(event_base_code as string) as event_base_code,
        cast(event_root_code as string) as event_root_code,
        cast(quad_class as integer) as quad_class,
        cast(goldstein_scale as real) as goldstein_scale,
        cast(num_mentions as integer) as num_mentions,
        cast(num_sources as integer) as num_sources,
        cast(num_articles as integer) as num_articles,
        cast(avg_tone as real) as avg_tone,
        cast(actor1_geo_type as integer) as actor1_geo_type,
        cast(actor1_geo_full_name as string) as actor1_geo_full_name,
        cast(actor1_geo_country_code as string) as actor1_geo_country_code,
        cast(actor1_geo_adm1_code as string) as actor1_geo_adm1_code,
        cast(actor1_geo_adm2_code as string) as actor1_geo_adm2_code,
        cast(actor1_geo_lat as real) as actor1_geo_lat,
        cast(actor1_geo_long as real) as actor1_geo_long,
        cast(actor1_geo_feature_id as string) as actor1_geo_feature_id,
        cast(actor2_geo_type as integer) as actor2_geo_type,
        cast(actor2_geo_full_name as string) as actor2_geo_full_name,
        cast(actor2_geo_country_code as string) as actor2_geo_country_code,
        cast(actor2_geo_adm1_code as string) as actor2_geo_adm1_code,
        cast(actor2_geo_adm2_code as string) as actor2_geo_adm2_code,
        cast(actor2_geo_lat as real) as actor2_geo_lat,
        cast(actor2_geo_long as real) as actor2_geo_long,
        cast(actor2_geo_feature_id as string) as actor2_geo_feature_id,
        cast(action_geo_type as integer) as action_geo_type,
        cast(action_geo_full_name as string) as action_geo_full_name,
        cast(action_geo_country_code as string) as action_geo_country_code,
        cast(action_geo_adm1_code as string) as action_geo_adm1_code,
        cast(action_geo_adm2_code as string) as action_geo_adm2_code,
        cast(action_geo_lat as real) as action_geo_lat,
        cast(action_geo_long as real) as action_geo_long,
        cast(action_geo_feature_id as string) as action_geo_feature_id,
        to_timestamp(cast(date_added as string), 'YYYYMMDDHH24MISS') as creation_ts,
        cast(url as string) as source_url

    from source

)

select * from final
where event_root_code = '14'