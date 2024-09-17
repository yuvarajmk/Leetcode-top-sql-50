--Last Person to Fit in the Bus
with detail_table as (
    elect turn, person_id id, person_name name, weight, sum(weight) over (order by turn rows between unbounded preceding and current row) total_weight
    from queue
)
select person_name
from queue
where turn = (
    select max(turn)
    from detail_table
    where total_weight <= 1000)
