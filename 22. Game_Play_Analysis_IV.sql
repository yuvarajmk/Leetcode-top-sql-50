--Game Play Analysis IV
with player_dates as (
    select player_id, min(event_date) first_date
    from activity
    group by player_id
)
select round(count(p.player_id) / count(distinct a.player_id),2) fraction
from activity a left join player_dates p on (a.event_date = p.first_date + 1 and a.player_id = p.player_id)
