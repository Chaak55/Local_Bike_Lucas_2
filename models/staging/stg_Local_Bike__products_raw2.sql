select cast(product_id as string) as product_id, 
product_name, 
cast(brand_id as string) as brand_id, 
cast(category_id as string) as category_id,
model_year,
list_price as unit_price
from {{source('Local_Bike','products_raw')}}



