{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}

WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'reviewer_name', 'review_date']) }} AS review_id,
  *
FROM src_reviews
{% if is_incremental() %}
WHERE review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}

-- {% if is_incremental() %}
--   {% if var("start_date", False) and var("end_date", False) %}
--     {{ log('Loading ' ~ this ~ ' incrementally (start_date: ' ~ var("start_date") ~ ', end_date: ' ~ var("end_date") ~ ')', info=True) }}
--     AND review_date >= '{{ var("start_date") }}'
--     AND review_date < '{{ var("end_date") }}'
--   {% else %}
--     AND review_date > (select max(review_date) from {{ this }})
--     {{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info=True)}}
--   {% endif %}
-- {% endif %}