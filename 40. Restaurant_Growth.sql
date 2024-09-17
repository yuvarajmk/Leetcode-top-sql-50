--Restaurant Growth
with restaurant_details as (
    select visited_on, sum(amount) amount
    from customer c
    group by visited_on 
    order by visited_on
),
final_details as (
    select to_char(visited_on,'YYYY-MM-DD') visited_on , round(sum(amount) over (order by visited_on rows between 6 preceding and 0 following),2) amount, 
    round(avg(amount) over (order by visited_on rows between 6 preceding and 0 following),2) average_amount,
    count(visited_on) over (order by visited_on rows between 6 preceding and 0 following) cnt
--    rownum rn
    from restaurant_details rd
)
select visited_on, amount, average_amount
from final_details
where cnt = 7 --rn > 6
select visited_on, amount, average_amount
from 
    (
        select to_char(visited_on,'YYYY-MM-DD') visited_on, 
        sum(amount) over (order by visited_on rows between 6 preceding and 0 following) amount, 
        round(avg(amount) over (order by visited_on rows between 6 preceding and 0 following),2) average_amount,
        count(visited_on) over (order by visited_on rows between 6 preceding and 0 following) cnt
        from 
            (
                select visited_on, sum(amount) amount from customer group by visited_on
            )
    )
where cnt = 7
order by visited_on
