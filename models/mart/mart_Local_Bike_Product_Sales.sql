{{config(materialized ='table')}}

select customer_id,
client_first_name,
client_last_name,
order_id,
order_date,
shipped_date,
discounted_amount,
product_id,
product_name,
brand_id,
brand_name,
category_id,
category_name,
store_id,
store_name,
staff_first_name,
staff_last_name
from {{ref("int_Local_Bike__product_sales_enrichie")}}