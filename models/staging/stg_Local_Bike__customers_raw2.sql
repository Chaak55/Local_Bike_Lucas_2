select cast(customer_id as string) as customer_id,
first_name as client_first_name,
last_name as client_last_name,
phone as client_phone,
email as client_email,
street as client_street,
city as client_city,
state as client_state,
cast(zip_code as string) as client_zip_code
from {{ source("Local_Bike", "customers_raw") }}