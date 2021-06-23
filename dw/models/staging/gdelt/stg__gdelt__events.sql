with source as (

    select * from {{ source('gdelt', 'gdelt_events') }}

),

final as (

    select distinct
        cast(gdelt_id as bigint) as gdelt_event_natural_key,

        to_timestamp(cast(date_added as string), 'YYYYMMDDHH24MISS') as creation_ts,
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

        cast(url as string) as source_url, 
        cast(is_root_event as integer) as is_root_event,
        lower(cast(event_code as string)) as event_code,
        lower(cast(event_base_code as string)) as event_base_code,
        lower(cast(event_root_code as string)) as event_root_code,
        
        lower(cast(actor1_code as string)) as actor1_code,
        lower(cast(actor1_name as string)) as actor1_name,
        lower(cast(actor1_country_code as string)) as actor1_country_code,
        lower(cast(actor1_known_group_code as string)) as actor1_known_group_code,
        lower(cast(actor1_ethnic_code as string)) as actor1_ethnic_code,
        lower(cast(actor1_religion1_code as string)) as actor1_religion1_code,
        lower(cast(actor1_religion2_code as string)) as actor1_religion2_code,
        lower(cast(actor1_type1_code as string)) as actor1_type1_code,
        lower(cast(actor1_type2_code as string)) as actor1_type2_code,
        lower(cast(actor1_type3_code as string)) as actor1_type3_code,
        cast(actor1_geo_type as integer) as actor1_geo_type,
        lower(cast(actor1_geo_full_name as string)) as actor1_geo_full_name,
        lower(cast(actor1_geo_country_code as string)) as actor1_geo_country_code,
        lower(cast(actor1_geo_adm1_code as string)) as actor1_geo_adm1_code,
        lower(cast(actor1_geo_adm2_code as string)) as actor1_geo_adm2_code,
        cast(actor1_geo_lat as number(8,6)) as actor1_geo_latitude,
        cast(actor1_geo_long as number(9,6)) as actor1_geo_longitude,
        lower(cast(actor1_geo_feature_id as string)) as actor1_geo_feature_id,

        lower(cast(actor2_code as string)) as actor2_code,
        lower(cast(actor2_name as string)) as actor2_name,
        lower(cast(actor2_country_code as string)) as actor2_country_code,
        lower(cast(actor2_known_group_code as string)) as actor2_known_group_code,
        lower(cast(actor2_ethnic_code as string)) as actor2_ethnic_code,
        lower(cast(actor2_religion1_code as string)) as actor2_religion1_code,
        lower(cast(actor2_religion2_code as string)) as actor2_religion2_code,
        lower(cast(actor2_type1_code as string)) as actor2_type1_code,
        lower(cast(actor2_type2_code as string)) as actor2_type2_code,
        lower(cast(actor2_type3_code as string)) as actor2_type3_code, 
        cast(actor2_geo_type as integer) as actor2_geo_type,
        lower(cast(actor2_geo_full_name as string)) as actor2_geo_full_name,
        lower(cast(actor2_geo_country_code as string)) as actor2_geo_country_code,
        lower(cast(actor2_geo_adm1_code as string)) as actor2_geo_adm1_code,
        lower(cast(actor2_geo_adm2_code as string)) as actor2_geo_adm2_code,
        cast(actor2_geo_lat as number(8,6)) as actor2_geo_latitude,
        cast(actor2_geo_long as number(9,6)) as actor2_geo_longitude,
        lower(cast(actor2_geo_feature_id as string)) as actor2_geo_feature_id,

        cast(action_geo_type as integer) as action_geo_type,
        lower(cast(action_geo_full_name as string)) as action_geo_full_name,
        lower(cast(action_geo_country_code as string)) as action_geo_country_code,
        lower(cast(action_geo_adm1_code as string)) as action_geo_adm1_code,
        lower(cast(action_geo_adm2_code as string)) as action_geo_adm2_code,
        cast(action_geo_lat as number(8,6)) as action_geo_latitude,
        cast(action_geo_long as number(9,6)) as action_geo_longitude,
        lower(cast(action_geo_feature_id as string)) as action_geo_feature_id,

        cast(quad_class as integer) as quad_class,
        cast(goldstein_scale as real) as goldstein_scale,
        cast(num_mentions as integer) as num_mentions,
        cast(num_sources as integer) as num_sources,
        cast(num_articles as integer) as num_articles,
        cast(avg_tone as real) as avg_tone
        

    from source

)

select * from final
where event_root_code = '14'