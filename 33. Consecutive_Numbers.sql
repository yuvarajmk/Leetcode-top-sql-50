--Consecutive Numbers
with logs_details as (
    select num , lead(num,1) over (order by id) next_record_num, lead(num,2) over (order by id) nxt_nxt_record_num,
    id , lead(id,1) over (order by id) nr_id , lead(id,2) over (order by id) nnr_id
from logs
)
select distinct num ConsecutiveNums 
from logs_details
where (num = next_record_num) and (next_record_num = nxt_nxt_record_num) and (id + 1 = nr_id) and (nr_id + 1 = nnr_id)
