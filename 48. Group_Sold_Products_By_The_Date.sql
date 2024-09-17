--Group Sold Products By The Date
with activities_details as (
    select to_char(sell_date,'YYYY-MM-DD') sell_date, product
    from activities
    group by sell_date, product
    order by 1,2
)
select sell_date, count(product) num_sold, listagg(product,',') within group (order by sell_date) "products"
from activities_details
group by sell_date
