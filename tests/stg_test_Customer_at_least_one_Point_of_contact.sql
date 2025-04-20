SELECT customer_id,
      client_email,
      client_phone
FROM {{ref("stg_Local_Bike__customers_raw2")}}
group by 1, 2, 3
having client_email is null
  and client_phone is null