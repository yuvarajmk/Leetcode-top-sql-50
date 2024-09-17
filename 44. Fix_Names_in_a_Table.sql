--Fix Names in a Table
select user_id , upper(substr(name,1,1)) || lower(substr(name,2,length(name))) name
from users
order by user_id
