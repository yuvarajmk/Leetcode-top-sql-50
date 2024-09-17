--The Number of Employees Which Report to Each Employee
select m.employee_id, m.name, count(e.employee_id) reports_count, round(avg(e.age),0) average_age
from employees e inner join employees m on (e.reports_to = m.employee_id)
group by m.employee_id, m.name
order by m.employee_id
