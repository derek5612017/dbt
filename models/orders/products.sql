-- customers.sql
{{ config(materialized='table') }}

select distinct 
    ROW_NUMBER() OVER (ORDER BY regexp_replace(`Product Name`, '[^\x20-\x7E]', '')) AS product_id
    , regexp_replace(`Product Name`, '[^\x20-\x7E]', '') as product_name
    ,`Product Category` as product_category
    ,`Product Sub-Category` as product_sub_category 
from workspace.default.bronze_orders where row_id is not null
