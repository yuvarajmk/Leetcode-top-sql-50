--Replace Employee ID With The Unique Identifier
select unique_id, name
from employees e left join employeeUNI eu on (e.id = eu.id)
