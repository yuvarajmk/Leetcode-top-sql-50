--Customers Who Bought All Products
select customer_id 
from customer c 
group by customer_id
having count(distinct product_key) = (select count(product_key) from product)
