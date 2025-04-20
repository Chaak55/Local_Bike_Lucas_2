with order_items as (
select order_id,
        order_item_unique_id,
        product_id,
        sum (order_item_quantity) as order_item_quantity,
        sum(discount) as discount,
        sum(order_item_quantity*(list_price*(1-discount))) as discounted_amount
  from {{ref("stg_Local_Bike__order_items_raw2")}}
  group by order_id, product_id, order_item_unique_id
),
 
    orders_amount as (
  select order_id,
  store_id,
  customer_id,
  staff_id,
  order_date,
  shipped_date
      from {{ref("stg_Local_Bike__orders_raw2")}}
),
 
    product_raw as(
      select product_id,
      product_name,
      brand_id,
      unit_price,
      category_id
       from {{ref("stg_Local_Bike__products_raw2")}}
),
 
    brand_product as (
      select brand_id,
      brand_name
      from {{ref("stg_Local_Bike__brands_raw2")}}
),
 
    category_product as (
      select category_id,
      category_name
      from {{ref("stg_Local_Bike__categories_raw2")}}
),
    client_info as (
      select customer_id,
      client_first_name,
      client_last_name
      from {{ref("stg_Local_Bike__customers_raw2")}}
),
    staff_info as (
      select staff_id,
      staff_first_name,
      staff_last_name,
      store_id
      from {{ref("stg_Local_Bike__staffs_raw2")}}
 
),
    store_info as (
      select store_id,
      store_name,
      from {{ref("stg_Local_Bike__stores_raw2")}}
)
 
select oa.customer_id,
cus.client_first_name,
cus.client_last_name,
ia.order_id,
oa.order_date,
oa.shipped_date,
ia.discounted_amount,
ia.product_id,
p.product_name,
p.brand_id,
b.brand_name,
p.category_id,
c.category_name,
sto.store_id,
sto.store_name,
staf.staff_first_name,
staf.staff_last_name
 
from order_items as ia
left join orders_amount as oa
on ia.order_id = oa.order_id
left join product_raw as p
on ia.product_id = p.product_id
left join brand_product as b
on p.brand_id = b.brand_id
left join category_product as c
on p.category_id = c.category_id
left join client_info as cus
on oa.customer_id = cus.customer_id
left join staff_info as staf
on oa.staff_id = staf.staff_id
left join store_info as sto
on oa.store_id = sto.store_id
group by oa.customer_id,cus.client_first_name, cus.client_last_name, ia.order_id, oa.order_date, oa.shipped_date, ia.discounted_amount, ia.product_id, p.product_name, p.brand_id, b.brand_name, p.category_id, c.category_name, sto.store_id, sto.store_name, staf.staff_first_name, staf.staff_last_name