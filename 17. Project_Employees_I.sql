--Project Employees I
select project_id, round(sum(experience_years)/count(name),2) as average_years
from project p inner join employee e on (p.employee_id = e.employee_id)
group by project_id
