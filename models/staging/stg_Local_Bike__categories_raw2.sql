select cast(category_id as string) as category_id,
       category_name
from {{ source("Local_Bike", "categories_raw") }}