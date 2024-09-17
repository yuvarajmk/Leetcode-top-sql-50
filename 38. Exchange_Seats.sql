--Exchange Seats
with detail_table as (
    select case when mod(id,2) = 1  then lead(id,1) over (order by id)
            when mod(id,2) = 0  then lag(id,1) over (order by id)
            else id
        end  new_id, 
        id , 
        student
from seat
)
select coalesce(new_id,id) id, student
from detail_table
order by 1
