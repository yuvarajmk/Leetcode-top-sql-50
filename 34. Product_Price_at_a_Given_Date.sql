--Product Price at a Given Date
with existing_products as (
    select *
    from products
    where (product_id, change_date) in (
        select product_id, max(change_date)
        from products
        where change_date <= to_date('2019-08-16','YYYY-MM-DD') 
        group by product_id)
),
unique_products as (
    select product_id 
    from products
    group by product_id
)
select p.product_id, coalesce(new_price,10) price
from existing_products e right join unique_products p on (p.product_id = e.product_id)
--
SELECT
  product_id,
  10 AS price
FROM
  Products
GROUP BY
  product_id
HAVING
  MIN(change_date) > '2019-08-16'
UNION ALL
SELECT
  product_id,
  new_price AS price
FROM
  Products
WHERE
  (product_id, change_date) IN (
    SELECT
      product_id,
      MAX(change_date)
    FROM
      Products
    WHERE
      change_date <= '2019-08-16'
    GROUP BY
      product_id
  )
