--Average Selling Price
select p.product_id, case when sum(units) is null then 0 else round(sum(price*units)/sum(units),2) end average_price
from prices p left join unitssold u on (p.product_id = u.product_id and u.purchase_date between p.start_Date and p.end_Date)
group by p.product_id
