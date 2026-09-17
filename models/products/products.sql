-- customers.sql
{{ config(materialized='table') }}

select distinct 
    ROW_NUMBER() OVER (ORDER BY regexp_replace(product_name, '[^\x20-\x7E]', '')) AS product_id
    , regexp_replace(product_name, '[^\x20-\x7E]', '') as product_name
    ,product_category as product_category
    ,product_sub_category as product_sub_category 
from workspace.default.bronze_orders where row_id is not null
