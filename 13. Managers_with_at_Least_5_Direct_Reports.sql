--Managers with at Least 5 Direct Reports
with managers_with_5_emps as (
    select managerid
    from employee
    group by managerid
    having count(id) >= 5
)
select name
from employee
where id in (select managerid from managers_with_5_emps)
