SELECT order_id,
    shipped_date,
    order_date,
       FROM {{ref("stg_Local_Bike__orders_raw2")}}
group by 1, 2,3
having shipped_date <= order_date