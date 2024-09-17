--List the Products Ordered in a Period
select product_name, sum(unit) unit
from products p inner join orders o on (p.product_id = o.product_id)
where to_char(order_date,'YYYY-MM') = '2020-02'
group by product_name
having sum(unit) >= 100
