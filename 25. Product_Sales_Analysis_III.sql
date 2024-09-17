--Product Sales Analysis III
with product_first_years as (
    select product_id , min(year) first_year--case when  year = first_value(year) over (partition by product_id order by year)
    from sales
    group by product_id
)
select s.product_id, pfy.first_year, s.quantity, s.price
from product_first_years pfy inner join sales s on (s.product_id = pfy.product_id and s.year = pfy.first_year)
