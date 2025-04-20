select cast(order_id as string) as order_id,
cast(item_id as string) as item_id,
cast(concat(order_id,'-',item_id)) as string) as order_unique_id,
cast(product_id as string) as product_id,
quantity as order_item_quantity,
list_price,
discount
from {{ source("Local_Bike", "order_items_raw") }}