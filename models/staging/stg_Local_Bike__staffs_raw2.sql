select cast(staff_id as string) as staff_id, 
first_name as staff_first_name, 
last_name as staff_last_name, 
email as staff_email,
phone as staff_phone,
active as staff_active,
cast(manager_id as string) as manager_id,
cast(store_id as store_id)
from{{source("Local_Bike",'staffs_raw')}}
