-- orders.sql
{{ config(materialized='table') }}

select  distinct 
    customer_id
    ,customer_name
    ,city
    ,state_or_province as state, 
    postal_code 
from workspace.default.bronze_orders where row_id is not null
