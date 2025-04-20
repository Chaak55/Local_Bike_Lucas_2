select cast(store_id as string) as store_id,
cast(product_id as string) as product_id,
cast(concat(store_id,'-',product_id) as string) as stock_unique_id,
quantity as stock_quantity
from {{source("Local_Bike",'stocks_raw')}}