select cast(brand_id as string) as brand_id,
brand_name
from {{ source("Local_Bike", "brands_raw") }}