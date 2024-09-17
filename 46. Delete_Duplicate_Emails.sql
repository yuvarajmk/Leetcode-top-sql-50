--Delete Duplicate Emails
delete 
from person
where (email,id) not in (select email, min(id) id from person group by email)
