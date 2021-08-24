{{ 
  config(
    unique_key='article_pk'
  )
}}

with s_articles as (

  select * from {{ ref('int__articles') }}

),

final as (

  select distinct
    {{ dbt_utils.surrogate_key([
        'gdelt_event_natural_key', 
        'article_url'
      ]) }} as article_pk, 
    {{ dbt_utils.surrogate_key(['gdelt_event_natural_key']) }} as event_fk, 

    gdelt_event_natural_key, 
    article_url, 

    article_ts,

    article_source_name,
    article_page_name,
    article_file_name,
    article_page_title,
    article_page_description,
    article_keywords

  from s_articles

)

select * from final
