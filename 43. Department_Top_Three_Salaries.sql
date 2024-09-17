--Department Top Three Salaries
with salary_table as (
    select d.name department, e.name employee, salary, dense_rank() over (partition by departmentid order by salary desc) rk
    from employee e inner join department d on (e.departmentid = d.id)
)
select department, employee, salary
from salary_table
where rk <= 3
