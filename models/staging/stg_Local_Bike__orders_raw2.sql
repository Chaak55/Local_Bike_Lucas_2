select cast(order_id as string) as order_id,
cast(customer_id as string) as customer_id,
order_status,
order_date,
required_date,
safe_cast(shipped_date as date) as shipped_date,
cast(store_id as string) as store_id,
cast(staff_id as string) as staff_id
from {{ source("Local_Bike", "order_raw") }}