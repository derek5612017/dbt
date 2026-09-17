-- customers.sql
{{ config(materialized='table') }}

select  distinct 
    ROW_NUMBER() OVER (ORDER BY customer_name, city, state_or_province, postal_code) AS customer_id
    ,customer_name
    ,city
    ,state_or_province as state,
    postal_code
    ,order_date as update_date 
from workspace.default.bronze_orders where row_id is not null
order by customer_name

