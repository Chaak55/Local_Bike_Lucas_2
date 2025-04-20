select cast(store_id as string) as store_id,
store_name,
phone as store_phone,
street as store_street,
email as store_email,
city as store_city,
state as store_state,
cast(zip_code as string) as store_zip_code
from {{ source("Local_Bike", "stores_raw") }}