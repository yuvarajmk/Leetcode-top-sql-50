--Second Highest Salary
select distinct nth_value(salary,2) over (order by salary desc rows between unbounded preceding and unbounded following) secondhighestsalary
from (select salary from employee group by salary)
