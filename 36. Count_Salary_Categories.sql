--Count Salary Categories
with bank_details as (
    select account_id, income, 
case when income < 20000 then 'Low Salary'
     when income <= 50000 then 'Average Salary'
     else 'High Salary'
end category
from accounts
),
category_details as (
    select 'Low Salary' category from dual
    union 
    select 'Average Salary' from dual
    union
    select 'High Salary' from dual
)
select c.category, count(account_id) accounts_count
from category_details c left join bank_details b on (c.category = b.category)
group by c.category
