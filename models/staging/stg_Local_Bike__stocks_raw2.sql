select cast(stock_id as string) as stock_id,
cast(product_id as string) as product_id,
cast(concat(stock_id,'-',product_id) as string) as stock_product_unique_id,
quantity as stock_quantity
from {{source("Local_Bike",'stocks_raw')}}