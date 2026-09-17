-- customers.sql
{{ config(materialized='table') }}

select  distinct 
    customer_id
    ,customer_name
    ,city
    ,state_or_province as state,
    postal_code
    ,order_date as update_date 
from workspace.default.bronze_orders where row_id is not null
order by customer_name

