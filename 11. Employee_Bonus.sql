--Employee Bonus
select name, bonus
from employee e left join bonus b on (e.empId = b.empID)
where coalesce(b.bonus,0) <1000
