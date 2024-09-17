--Primary Department for Each Employee
with adjusted_employee as (
    select employee_id,  department_id, case when count(department_id) over (partition by employee_id)=1 then 'Y' else primary_flag end flg
    from employee
)
select employee_id, department_id
from adjusted_employee
where flg='Y'
