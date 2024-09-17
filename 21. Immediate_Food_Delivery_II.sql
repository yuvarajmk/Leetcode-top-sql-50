--Immediate Food Delivery II
with delivery_details as (
    select d.*, case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end order_type,
    case when order_date = min(order_Date) over (partition by customer_id) then 'first_order' else 'not_first_order' end as first_order_flg
    from delivery d
)
select round(sum(case when order_type = 'immediate' and first_order_flg='first_order' then 1 else 0 end)*100/count(distinct customer_id),2)  immediate_percentage
from delivery_details
with min_customer_delivery as
(select customer_id, min(order_date) oid
from delivery
group by customer_id )
select round(sum(case when order_date = CUSTOMER_PREF_DELIVERY_DATE  then 1 else 0 end)/count(d.customer_id)*100,2) immediate_percentage-- ,count(d.customer_id)
from delivery d inner join min_customer_delivery c on (d.customer_id = c.customer_id and d.order_date = oid)
